import 'package:flutter/material.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/services/dio_provider.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/app_fonts.dart';
import 'package:my_bookia/core/utils/text_styles.dart';

void main() {
  DioProvider.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      routerConfig: Routs.routes,

      themeMode: ThemeMode.light,

      theme: ThemeData(
        fontFamily: AppFonts.dmSerifDisplayFamily,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primayColor,
          onSurface: AppColors.darkColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          selectedItemColor: AppColors.primayColor,
          unselectedItemColor: AppColors.grayColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),

        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColors.accentColor,
          filled: true,

          hintStyle: TextStyles.styleSize15.copyWith(
            color: AppColors.grayColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.borderColor),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.redColor),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.redColor),
          ),
        ),
      ),

      darkTheme: ThemeData(
        fontFamily: AppFonts.dmSerifDisplayFamily,
        scaffoldBackgroundColor: AppColors.darkColor,

        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primayColor,
          onSurface: AppColors.backgroundColor,
          brightness: Brightness.dark,
        ),
      ),
    );
  }
}
