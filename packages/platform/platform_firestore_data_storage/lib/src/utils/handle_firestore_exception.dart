import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';

/// Helper to map Firebase codes to your FailureType enum
FailedResult<T> handleFirestoreError<T>(FirebaseException e, StackTrace trace) {
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