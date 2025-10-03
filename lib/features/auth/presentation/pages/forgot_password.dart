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
import 'package:my_bookia/core/widgets/custom_text_form_field.dart';
import 'package:my_bookia/core/widgets/dialogs.dart';
import 'package:my_bookia/core/widgets/main_button.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_state.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          pushTo(context, Routs.otpVerification);
        } else if (state is ForgotPasswordError) {
          showErrorDialogue(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBarWithBack(),

        body: Padding(
          padding: AppConstants.bodyPadding,
          child: Form(
            key: cubit.formkeyForgotPassword,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(20),
                Text(
                  AppStrings.forgotPassword_2,
                  style: TextStyles.styleSize30,
                ),
                Gap(10),
                Text(
                  AppStrings.dontWorry,
                  style: TextStyles.styleSize16.copyWith(
                    color: AppColors.grayColor,
                  ),
                ),

                Gap(30),
                CustomTextFormField(
                  hintText: AppStrings.emailHint,
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter valid email';
                    } else {
                      return null;
                    }
                  },
                ),
                Gap(30),
                MainButton(
                  label: AppStrings.sendCode,
                  onPressed: () {
                    if (cubit.formkeyForgotPassword.currentState!.validate()) {
                      cubit.forgotPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.rememberPassword_2,
                style: TextStyles.styleSize15,
              ),
              TextButton(
                onPressed: () {
                  pushReplacementTo(context, Routs.login);
                },
                child: Text(AppStrings.login, style: TextStyles.styleSize15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
