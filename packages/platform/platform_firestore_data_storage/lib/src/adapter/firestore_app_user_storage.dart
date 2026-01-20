import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:platform_firestore_data_storage/src/documents/app_user_document.dart';
import 'package:platform_firestore_data_storage/src/mapper/app_user_mapper.dart';

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
      return _handleFirestoreError(e, trace);
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
      return _handleFirestoreError(e, trace);
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
      return _handleFirestoreError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(message: e.toString(), failureType: FailureType.unknown, trace: trace));
    }
  }

  /// Helper to map Firebase codes to your FailureType enum
  FailedResult<T> _handleFirestoreError<T>(FirebaseException e, StackTrace trace) {
    FailureType type;

    switch (e.code) {
      case 'permission-denied':
        type = FailureType.permission;
        break;
      case 'unavailable': // Offline or service down
        type = FailureType.network;
        break;
      case 'already-exists':
        type = FailureType.duplicate;
        break;
      case 'not-found':
        type = FailureType.notFound;
        break;
      case 'failed-precondition': // Often means a missing index or query issue
        type = FailureType.state;
        break;
      case 'aborted': // Transaction issues
        type = FailureType.state;
        break;
      default:
        // 'data-loss', 'internal', 'invalid-argument', 'resource-exhausted', etc.
        type = FailureType.database;
    }

    return FailedResult(AppFailure(message: e.message ?? "Firestore Error: ${e.code}", failureType: type, trace: trace));
  }
}