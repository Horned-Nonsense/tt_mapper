import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../services/auth_service.dart';
import '../core/base_cubit.dart';

part 'login_page_state.dart';

@injectable
class LoginPageCubit extends BaseCubit<LoginPageState> {
  final AuthService _authService;

  LoginPageCubit(this._authService)
      : super(const LoginPageState(
          status: LoginPageStatus.initial,
        ));

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: LoginPageStatus.loading));

    await makeErrorHandledCall(() async {
      await _authService.signInWithGoogle();
    });
  }

  @override
  void handleError(String errorMessage) {
    emit(state.copyWith(
      status: LoginPageStatus.error,
      errorMessage: errorMessage,
    ));
  }
}
