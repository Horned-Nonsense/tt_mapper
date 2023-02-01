import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../services/auth_service.dart';
import '../core/base_cubit.dart';

part 'app_control_state.dart';

@injectable
class AppControlCubit extends BaseCubit<AppControlState> {
  final AuthService _authService;
  late final StreamSubscription<User?> _userSubscription;

  AppControlCubit(
    this._authService,
  ) : super(const AppControlState(
          status: AppControlStatus.initial,
        )) {
    _userSubscription =
        _authService.authStateChanges.listen(_onUserAuthStateChanged);
  }

  Future<void> _onUserAuthStateChanged(User? user) async {
    if (user != null) {
      emit(state.copyWith(
        status: AppControlStatus.authenticated,
        user: user,
      ));
    } else {
      emit(state.copyWith(
        status: AppControlStatus.unauthenticated,
      ));
    }
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: AppControlStatus.error,
      errorMessage: errorMessage,
    ));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
