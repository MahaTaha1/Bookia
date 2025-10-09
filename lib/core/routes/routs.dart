import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:my_bookia/features/auth/presentation/pages/create_new_password_screen.dart';
import 'package:my_bookia/features/auth/presentation/pages/forgot_password.dart';
import 'package:my_bookia/features/auth/presentation/pages/login_screen.dart';
import 'package:my_bookia/features/auth/presentation/pages/otp_verification.dart';
import 'package:my_bookia/features/auth/presentation/pages/password_changed_screen.dart';
import 'package:my_bookia/features/auth/presentation/pages/register_screen.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:my_bookia/features/home/presentation/pages/details_screen.dart';
import 'package:my_bookia/features/main/main_app_screen.dart';
import 'package:my_bookia/features/splash/splash_screen.dart';
import 'package:my_bookia/features/welcom/welcome_screen.dart';

class Routs {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String mainApp = '/mainApp';
  static const String creatNewPassword = '/creatNewPassword';
  static const String forgotPassword = '/forgotPasswordScreen';
  static const String otpVerification = '/otpVerifiction';
  static const String passwordChanged = '/passwordChanged';
  static const String details = '/details';

  static final routes = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(path: mainApp, builder: (context, state) => MainAppScreen()),
      GoRoute(
        path: creatNewPassword,
        builder: (context, state) {
          int otp = state.extra as int;
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: CreateNewPasswordScreen(otp: otp),
          );
        },
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) {
            return AuthCubit();
          },
          child: ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: otpVerification,
        builder: (context, state) {
          final email = state.extra as String?;
          return BlocProvider(
            create: (context) {
              return AuthCubit();
            },
            child: OtpVerificationScreen(email: email),
          );
        },
      ),

      GoRoute(
        path: passwordChanged,
        builder: (context, state) => PasswordChangedScreen(),
      ),

      GoRoute(path: details, builder: (context, state) {
        return DetailsScreen(product: state.extra as Product,);
      }),
    ],
  );
}
