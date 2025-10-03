import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/app_bar_with_back.dart';


class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: Padding(
        padding: AppConstants.bodyPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.createNewPassword, style: TextStyles.styleSize30),
            Gap(10),
            Text(
              AppStrings.yourNewPassword,
              style: TextStyles.styleSize16.copyWith(
                color: AppColors.grayColor,
              ),
            ),
             Gap(30),
             //PasswordTextFormField(controller: controller),

          ],
        ),
      ),
    );
  }
}
