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
import 'package:my_bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    print(' Email received from previous screen: $email');
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is CheckForgotPasswordCodeSuccessState) {
          // success
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          pushTo(
            context,
            Routs.creatNewPassword,
            extra: int.parse(cubit.otpController.text),
          );
        } else if (state is CheckForgotPasswordCodeErrorState) {
          showErrorDialogue(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBarWithBack(),
        body: Padding(
          padding: AppConstants.bodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(10),
              Text(AppStrings.otpVerification, style: TextStyles.styleSize30),
              Gap(30),
              Text(
                AppStrings.enterVerificationCode,
                style: TextStyles.styleSize16.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
              Gap(30),

              PinCodeTextField(
                appContext: context,
                length: 6, // أربع خانات
                controller: cubit.otpController,
                keyboardType: TextInputType.number,
                animationType: AnimationType.none,
                enableActiveFill: true,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 30,
                  fieldWidth: 30,
                  activeFillColor: Colors.white,
                  selectedFillColor: AppColors.primayColor,
                  inactiveFillColor: Colors.grey[200],
                  activeColor:
                      AppColors.primayColor, // لون الحدود لما تكون نشطة
                  inactiveColor: Colors.grey, // لون الحدود لما تكون غير نشطة
                ),
                mainAxisAlignment: MainAxisAlignment
                    .spaceEvenly, // يوزع الخانات أفقياً بالتساوي
                onChanged: (value) {},
                onCompleted: (value) {
                  print("OTP entered: $value");
                },
              ),
              Gap(40),

              MainButton(
                label: AppStrings.verify,
                onPressed: () {
                  cubit.checkForgotPassword(email!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
