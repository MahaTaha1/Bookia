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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          // go home
          pop(context);
          pushAndRemoveUntil(context, Routs.mainApp);
          print('*****   go home Successfully **************');
        } else if (state is AuthFailureState) {
          pop(context);
          showErrorDialogue(context, state.error);
        } else if (state is AuthLoadingState) {
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
                  Text(
                    AppStrings.registerTogetStarted,
                    style: TextStyles.styleSize30,
                  ),
                  Gap(32),
                  CustomTextFormField(
                    controller: cubit.nameController,
                    hintText: AppStrings.usernameHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(15),
                  CustomTextFormField(
                    controller: cubit.emailController,
                    hintText: AppStrings.emailHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter valid email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(15),

                  PasswordTextFormField(
                    controller: cubit.passwordController,
                    hintText: AppStrings.passwordHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Gap(15),
                  PasswordTextFormField(
                    controller: cubit.confirmPasswordController,
                    hintText: AppStrings.confirmationPasswordHint,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your confirm password';
                      } else {
                        return null;
                      }
                    },
                  ),

                  Gap(30),
                  MainButton(
                    label: AppStrings.register,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                    },
                  ),
                  // Gap(20),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.alreadyHAveAnAccount,
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
