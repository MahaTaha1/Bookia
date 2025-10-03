class AuthState {}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailureState extends AuthState {
  final String error;

  AuthFailureState(this.error);
}

class ForgotPasswordLoading extends AuthState {}

class ForgotPasswordSuccess extends AuthState {
  final String message;
  ForgotPasswordSuccess(this.message);
}

class ForgotPasswordError extends AuthState {
  final String error;
  ForgotPasswordError(this.error);
}

class CheckForgotPasswordCodeSuccessState extends AuthState {
  final String message;
  CheckForgotPasswordCodeSuccessState(this.message);
}

class CheckForgotPasswordCodeErrorState extends AuthState {
  final String error;
  CheckForgotPasswordCodeErrorState(this.error);
}
