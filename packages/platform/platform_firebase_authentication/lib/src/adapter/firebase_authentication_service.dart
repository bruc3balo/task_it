import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppAuthenticatorService)
class FirebaseAuthenticationService extends AppAuthenticatorService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<TaskResult<void>> forgotPassword(EmailAddressValue email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.value);
      return SuccessResult(
        result: null,
        message: "Password reset link has been sent to ${email.value}",
      );
    } on FirebaseAuthException catch (e, trace) {
      return _handleAuthError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(
        message: e.toString(),
        failureType: FailureType.unknown,
        trace: trace,
      ));
    }
  }

  @override
  Future<TaskResult<AuthUser>> getCurrentUser() async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;

      if (currentUser == null) {
        return FailedResult(AppFailure(
          failureType: FailureType.notFound,
          message: "User not logged in",
        ));
      }

      if (currentUser.email == null) {
        return FailedResult(AppFailure(
          failureType: FailureType.state,
          message: "User logged in but has no email address",
        ));
      }

      final EmailAddressValue email = EmailAddressValue(currentUser.email!);
      final AuthUser authUser = AuthUser(
        id: AppUserIdValue(currentUser.uid),
        emailAddressValue: email,
      );

      return SuccessResult(result: authUser, message: "Logged in user found");
    } catch (e, trace) {
      return FailedResult(AppFailure(
        message: e.toString(),
        failureType: FailureType.unknown,
        trace: trace,
      ));
    }
  }

  @override
  Future<TaskResult<AppUserIdValue>> signIn(SignInForm form) async {
    try {
      final UserCredential currentUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: form.email.value,
        password: form.password,
      );

      final User? user = currentUser.user;
      if (user == null) {
        return FailedResult(AppFailure(
          failureType: FailureType.notFound,
          trace: currentUser,
          message: "User not found but credentials loaded",
        ));
      }

      final AppUserIdValue userId = AppUserIdValue(user.uid);
      return SuccessResult(result: userId, message: "Logged in user found");
    } on FirebaseAuthException catch (e, trace) {
      return _handleAuthError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(
        message: e.toString(),
        failureType: FailureType.unknown,
        trace: trace,
      ));
    }
  }

  @override
  Future<TaskResult<AppUserIdValue>> signUp(SignUpForm form) async {
    try {
      final UserCredential currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: form.email.value,
        password: form.password.value,
      );

      final User? user = currentUser.user;
      if (user == null) {
        return FailedResult(AppFailure(
          failureType: FailureType.notFound,
          trace: currentUser,
          message: "User not found but credentials loaded",
        ));
      }

      final AppUserIdValue userId = AppUserIdValue(user.uid);
      return SuccessResult(result: userId, message: "Newly created user found");
    } on FirebaseAuthException catch (e, trace) {
      return _handleAuthError(e, trace);
    } catch (e, trace) {
      return FailedResult(AppFailure(
        message: e.toString(),
        failureType: FailureType.unknown,
        trace: trace,
      ));
    }
  }

  /// Helper to map FirebaseAuth codes to your FailureType enum
  FailedResult<T> _handleAuthError<T>(FirebaseAuthException e, StackTrace trace) {
    FailureType type;

    switch (e.code) {
    // Network & Connection
      case 'network-request-failed':
        type = FailureType.network;
        break;

    // Registration Issues
      case 'email-already-in-use':
      case 'credential-already-in-use':
        type = FailureType.duplicate;
        break;

    // Access & Permission Issues
      case 'wrong-password':
      case 'user-disabled':
      case 'operation-not-allowed':
      case 'requires-recent-login': // For sensitive operations
        type = FailureType.permission;
        break;

    // Not Found
      case 'user-not-found':
      case 'auth/user-not-found': // Sometimes codes are prefixed
        type = FailureType.notFound;
        break;

    // State / Validation Issues
      case 'invalid-email':
      case 'weak-password':
      case 'too-many-requests': // Often happens when users spam login
        type = FailureType.state;
        break;

    // Fallback
      default:
        type = FailureType.unknown; // Or FailureType.database if you treat auth as DB
    }

    return FailedResult(AppFailure(
      message: e.message ?? "Auth Error: ${e.code}",
      failureType: type,
      trace: trace,
    ));
  }
}