import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/logging.dart';

abstract class BaseCubit<TState> extends Cubit<TState> {
  BaseCubit(TState initState) : super(initState);

  void handleError(String errorMessage);

  Future<void> makeErrorHandledCall(AsyncValueGetter callback) async {
    try {
      await callback();
    } on PlatformException catch (exception) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'PlatformException in makeErrorHandledCall()',
        error: exception,
      );
      handleError(exception.toString());
    } on FirebaseAuthException catch (exception) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'FirebaseAuthException in makeErrorHandledCall()',
        error: exception,
      );
      handleError(exception.message.toString());
    } catch (exception) {
      Logging.error(
        className: runtimeType.toString(),
        message: 'UnknownExeption in makeErrorHandledCall()',
        error: exception,
      );
      handleError(exception.toString());
    }
  }
}
