import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '/models/exceptions/firebase_auth_exeptions.dart';

abstract class BaseService {
  BaseService();

  String _getLocalizedFirebaseAuthException(FirebaseAuthException exception) {
    String errorMessage = 'Unknown error';
    for (final e in FirebaseAuthExeptions.values) {
      if (e.code == exception.code) {
        errorMessage = e.errorMessage();
      }
    }
    return errorMessage;
  }

  Future<T> makeErrorHandledCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on FirebaseAuthException catch (exception) {
      throw FirebaseAuthException(
        code: exception.code,
        message: _getLocalizedFirebaseAuthException(exception),
      );
    } on PlatformException {
      rethrow;
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
