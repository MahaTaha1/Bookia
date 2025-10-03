import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookia/features/auth/data/models/auth_params.dart';
import 'package:my_bookia/features/auth/data/repo/auth_repo.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  var formKey = GlobalKey<FormState>();
  var formkeyForgotPassword=GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var otpController = TextEditingController();

  register() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.register(
      params: AuthParams(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text,
      ),
    );

    if (res != null) {
      clearAllFields();
      emit(AuthSuccessState());
    } else {
      emit(AuthFailureState('Registeration Failed'));
    }
  }

  login() async {
    emit(AuthLoadingState());
    var res = await AuthRepo.login(
      params: AuthParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (res != null) {
      clearAllFields();
      emit(AuthSuccessState());
    } else {
      emit(AuthFailureState('Login Failed'));
    }
  }

  clearAllFields() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  forgotPassword() async {
    emit(ForgotPasswordLoading());

    var res = await AuthRepo.forgotPassword(
      params: AuthParams(email: emailController.text),
    );
    if (res != null) {
      clearAllFields();
      emit(ForgotPasswordSuccess(res.message!));
    } else {
      emit(ForgotPasswordError('Failed to send reset email'));
    }
  }

  checkForgotPassword() async {
    var res = await AuthRepo.checkForgotPassword(
      email: emailController.text.trim(),
      otp: otpController.text.trim(),
    );

    if (res == true) {
      emit(CheckForgotPasswordCodeSuccessState("OTP Verified Successfully"));
      otpController.clear();
      emailController.clear();
    } else {
      emit(CheckForgotPasswordCodeErrorState("Invalid OTP"));
    }
  }
}
