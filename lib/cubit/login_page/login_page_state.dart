part of 'login_page_cubit.dart';

enum LoginPageStatus {
  initial,
  loading,
  error,
  success;

  bool get isInitial => this == LoginPageStatus.initial;
  bool get isLoading => this == LoginPageStatus.loading;
  bool get isError => this == LoginPageStatus.error;
  bool get isSuccess => this == LoginPageStatus.success;
}

class LoginPageState extends Equatable {
  final LoginPageStatus status;
  final String errorMessage;

  const LoginPageState({
    required this.status,
    this.errorMessage = '',
  });

  LoginPageState copyWith({
    LoginPageStatus? status,
    String? errorMessage,
  }) {
    return LoginPageState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
      ];
}
