import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/main_button.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(AppImages.successSvg, height: 100, width: 100),
              Gap(35),
              Text(AppStrings.passwordChanged, style: TextStyles.styleSize24),
              Gap(5),
              Text(
                AppStrings.yourPasswordChanged,
                style: TextStyles.styleSize15.copyWith(
                  color: AppColors.grayColor,
                ),
              ),
              MainButton(label:AppStrings.backToLogin ,
              onPressed:(){} ,),
            ],
          ),
        ),
      ),
    );
  }
}
