import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_firestore_data_storage/src/documents/app_user_document.dart';
import 'package:platform_firestore_data_storage/src/mapper/app_user_mapper.dart';
import 'package:platform_firestore_data_storage/src/utils/handle_firestore_exception.dart';

@LazySingleton(as: AppUserDataSource)
class FirestoreAppUserDataStore extends AppUserDataSource {
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection("app_user")
      .withConverter<AppUserDocument>(fromFirestore: (snap, _) => AppUserDocument.fromJson(snap.data()!), toFirestore: (model, _) => model.toJson());

  final AppUserMapper _userMapper = AppUserMapper();

  @override
  Future<TaskResult<AppUserEntity>> findUserByEmail(EmailAddressValue email) async {
    try {
      var query = _userCollection.where("email", isEqualTo: email.value).orderBy("created_at", descending: false).limit(1);

      var snapshot = await query.get();
      var doc = snapshot.docs.firstOrNull;

      if (doc == null || !doc.exists) {
        return FailedResult(AppFailure(message: "User not found", failureType: FailureType.notFound, trace: snapshot));
      }

      final AppUserDocument userDoc = doc.data() as AppUserDocument;
      final AppUserEntity userEntity = _userMapper.toEntity(userDoc);
      return SuccessResult(result: userEntity, message: "User found");
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }

  @override
  Future<TaskResult<AppUserEntity>> findUserById(AppUserIdValue id) async {
    try {
      var query = _userCollection.doc(id.value);
      var snapshot = await query.get();

      if (!snapshot.exists) {
        return FailedResult(AppFailure(message: "User not found", failureType: FailureType.notFound, trace: snapshot));
      }

      final AppUserDocument userDoc = snapshot.data() as AppUserDocument;
      final AppUserEntity userEntity = _userMapper.toEntity(userDoc);
      return SuccessResult(result: userEntity, message: "User found");
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }

  @override
  Future<TaskResult<AppUserEntity>> saveUser(AppUserEntity user) async {
    try {
      await _userCollection.doc(user.id.value).set(_userMapper.toDocument(user));
      return SuccessResult(result: user, message: "User saved");
    } on FirebaseException catch (e, trace) {
      return handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }
}
