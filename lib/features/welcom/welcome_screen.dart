import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/routes/navigations.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/main_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.welcome,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            left: 20,
            right: 20,
            top: 0,
            bottom: 0,
            child: Column(
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppImages.logoSvg),
                Gap(15),
                Text(
                  AppStrings.orderYourBookNow,
                  style: TextStyles.styleSize18,
                ),
                Spacer(flex: 4),
                MainButton(
                  label: AppStrings.login,
                  onPressed: () {
                    pushTo(context, Routs.login);
                  },
                ),

                Gap(15),
                MainButton(
                  label: AppStrings.register,
                  bgColor: AppColors.backgroundColor,
                  textColor: AppColors.darkColor,
                  borderColor: AppColors.darkColor,
                  onPressed: () {
                    pushTo(context, Routs.register);
                  },
                ),

                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
