import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/routes/navigations.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/app_bar_with_back.dart';
import 'package:my_bookia/core/widgets/custom_text_form_field.dart';
import 'package:my_bookia/core/widgets/dialogs.dart';
import 'package:my_bookia/core/widgets/main_button.dart';
import 'package:my_bookia/core/widgets/password_text_form_field.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:my_bookia/features/auth/presentation/widgets/social_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          // home
          pop(context);
          print('********* LogIn success *************');
        } else if (state is AuthFailureState) {
          // fail
          pop(context);
          showErrorDialogue(context, state.error);
        } else if (state is AuthLoadingState) {
          // loading
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBarWithBack(),

        body: Padding(
          padding: AppConstants.bodyPadding,
          child: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Text(AppStrings.welcomBack, style: TextStyles.styleSize30),
                  Gap(32),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: AppStrings.emailHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter valid Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(15),

                  PasswordTextFormField(
                    hintText: AppStrings.passwordHint,
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter valid password';
                      } else {
                        return null;
                      }
                    },
                  ),

                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: TextButton(
                      onPressed: () {
                        pushTo(context, Routs.forgotPassword);
                      },
                      child: Text(
                        AppStrings.forgotPassword,
                        style: TextStyles.styleSize15,
                      ),
                    ),
                  ),
                  Gap(20),
                  MainButton(
                    label: AppStrings.login,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                  Gap(20),

                  SocialLogin(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppStrings.dontHaveAnAccount, style: TextStyles.styleSize15),
              TextButton(
                onPressed: () {
                  pushReplacementTo(context, Routs.register);
                },
                child: Text(AppStrings.register, style: TextStyles.styleSize15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
