import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/routes/navigations.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/services/local/shared_pref.dart';
import 'package:my_bookia/core/utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var isLogedIn = SharedPref.getToken() != null;
    Future.delayed(Duration(seconds: 2), () {
      if (isLogedIn) {
        pushReplacementTo(context, Routs.mainApp);
      } else {
        pushReplacementTo(context, Routs.welcome);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.logoSvg),
            Gap(10),
            Text('Oreder your book now', style: TextStyles.styleSize18),
          ],
        ),
      ),
    );
  }
}
