import 'firebase_exeptions_constants.dart';

enum FirebaseAuthExeptions {
  userNotFound,
  invalidEmail,
  wrongPassword,
  weakPassword,
  emailAlreadyInUse,
  accountExistsWithDifferentCredential,
  unknown;

  String get code {
    switch (this) {
      case FirebaseAuthExeptions.userNotFound:
        return FirebaseExeptionsConstants.userNotFound;
      case FirebaseAuthExeptions.invalidEmail:
        return FirebaseExeptionsConstants.invalidEmail;
      case FirebaseAuthExeptions.wrongPassword:
        return FirebaseExeptionsConstants.wrongPassword;
      case FirebaseAuthExeptions.weakPassword:
        return FirebaseExeptionsConstants.weakPassword;
      case FirebaseAuthExeptions.emailAlreadyInUse:
        return FirebaseExeptionsConstants.emailAlreadyInUse;
      case FirebaseAuthExeptions.accountExistsWithDifferentCredential:
        return FirebaseExeptionsConstants.accountExistsWithDifferentCredential;
      case FirebaseAuthExeptions.unknown:
        return FirebaseExeptionsConstants.unknown;
    }
  }

  String errorMessage() {
    switch (this) {
      case FirebaseAuthExeptions.userNotFound:
        return 'User not found';
      case FirebaseAuthExeptions.invalidEmail:
        return 'Invalid email';
      case FirebaseAuthExeptions.wrongPassword:
        return 'Wrong password';
      case FirebaseAuthExeptions.weakPassword:
        return 'Weak password';
      case FirebaseAuthExeptions.emailAlreadyInUse:
        return 'Email already in use';
      case FirebaseAuthExeptions.accountExistsWithDifferentCredential:
        return 'Account exists with different credential';
      case FirebaseAuthExeptions.unknown:
        return 'Unknown error';
    }
  }
}
