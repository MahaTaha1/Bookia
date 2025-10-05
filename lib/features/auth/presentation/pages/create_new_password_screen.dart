import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/routes/navigations.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/app_bar_with_back.dart';
import 'package:my_bookia/core/widgets/dialogs.dart';
import 'package:my_bookia/core/widgets/main_button.dart';
import 'package:my_bookia/core/widgets/password_text_form_field.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_state.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key, this.otp});
  final int? otp;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CheckForgotPasswordCodeSuccessState) {
          // success
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          pushTo(context, Routs.passwordChanged);
        } else if (state is CheckForgotPasswordCodeErrorState) {
          showErrorDialogue(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBarWithBack(),
        body: Padding(
          padding: AppConstants.bodyPadding,
          child: Form(
            key: cubit.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.createNewPassword,
                  style: TextStyles.styleSize30,
                ),
                Gap(10),
                Text(
                  AppStrings.yourNewPassword,
                  style: TextStyles.styleSize16.copyWith(
                    color: AppColors.grayColor,
                  ),
                ),
                Gap(30),

                PasswordTextFormField(
                  controller: cubit.passwordController,
                  hintText: AppStrings.newPasswordHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      'please enter valid password';
                    } else {
                      return null;
                    }
                    return null;
                  },
                ),

                PasswordTextFormField(
                  controller: cubit.confirmPasswordController,
                  hintText: AppStrings.confirmationPasswordHint,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      'please enter valid password';
                    } else {
                      return null;
                    }
                    return null;
                  },
                ),

                MainButton(
                  label: AppStrings.resetPassword,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.otpController.text = otp.toString();
                      cubit.createNewPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
