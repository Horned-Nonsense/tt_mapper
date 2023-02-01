part of 'app_control_cubit.dart';

enum AppControlStatus {
  initial,
  authenticated,
  unauthenticated,
  error;

  bool get isInitial => this == AppControlStatus.initial;

  bool get isAuthenticated => this == AppControlStatus.authenticated;

  bool get isUnauthenticated => this == AppControlStatus.unauthenticated;

  bool get isError => this == AppControlStatus.error;
}

class AppControlState extends Equatable {
  final AppControlStatus status;
  final String errorMessage;
  final User? user;

  const AppControlState({
    required this.status,
    this.errorMessage = '',
    this.user,
  });

  AppControlState copyWith({
    AppControlStatus? status,
    String? errorMessage,
    User? user,
  }) {
    return AppControlState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        user,
      ];
}
