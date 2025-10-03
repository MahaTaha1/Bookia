import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Gap(20),
            Text(AppStrings.or),
            Gap(20),
            Expanded(child: Divider()),
          ],
        ),

        Gap(20),
        SocialButton(
          onPressed: () {},
          label: AppStrings.loginWithGoogle,
          image: AppImages.googleSvg,
        ),

        Gap(10),

        SocialButton(
          onPressed: () {},
          label: AppStrings.loginWithApple,
          image: AppImages.appleSvg,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  final String image;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: AppConstants.badding15,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image),
            Gap(10),
            Text(label, style: TextStyles.styleSize15),
          ],
        ),
      ),
    );
  }
}
