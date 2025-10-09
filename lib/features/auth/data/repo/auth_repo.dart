import 'dart:developer';

import 'package:my_bookia/core/services/api/api_endpoints.dart';
import 'package:my_bookia/core/services/dio_provider.dart';
import 'package:my_bookia/core/services/local/shared_pref.dart';
import 'package:my_bookia/features/auth/data/models/auth_params.dart';
import 'package:my_bookia/features/auth/data/models/auth_response/auth_response.dart';
import 'package:my_bookia/features/auth/data/models/auth_response/forgot_password_response/forgot_password_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register({required AuthParams params}) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.register,
        data: params.toJson(),
      );

      if (res.statusCode == 201) {
        // success
        var object = AuthResponse.fromJson(res.data);
        SharedPref.setUserData(object.data?.user);
        SharedPref.setToken(object.data?.token);
        return object;
      } else {
        return null;
        // error
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  } // reg

  static Future<AuthResponse?> login({required AuthParams params}) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.login,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        //success
        var object = AuthResponse.fromJson(res.data);

        SharedPref.setUserData(object.data?.user);
        SharedPref.setToken(object.data?.token);
        return object;
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  } //end login

  static Future<ForgotPasswordResponse?> forgotPassword({
    required AuthParams params,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.forgotPassword,
        data: params.toJson(),
      );

      if (res.statusCode == 200) {
        //success
        return ForgotPasswordResponse.fromJson(res.data);
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool> checkForgotPassword({
    required String email,
    required String otp,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.checkForgotPassword,
        data: {'email': email, 'verify_code': int.tryParse(otp)},
      );

      if (res.statusCode == 200) {
        // success
        return true;
      } else {
        // error
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  } //method

  static Future<bool> creatNewPassword({
    required int otp,
    required String newPassword,
    required String passwordConfirmation,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.resetPassword,
        data: {
          'verify_code': otp,
          'new_password': newPassword,
          'new_password_confirmation': passwordConfirmation,
        },
      );

      if (res.statusCode == 200) {
        // success
        return true;
      } else {
        // error
        return false;
      }
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  } //method
}
