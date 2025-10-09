import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_bookia/core/constants/app_images.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithBack({super.key, this.action});

  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(AppImages.backSvg),
      ),
      centerTitle: false,

      actions: [action ?? const SizedBox()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
