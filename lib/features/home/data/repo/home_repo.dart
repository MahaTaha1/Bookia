import 'dart:developer';

import 'package:my_bookia/core/services/api/api_endpoints.dart';

import 'package:my_bookia/core/services/dio_provider.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:my_bookia/features/home/data/models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<BestSellerResponse?> getBestSeller() async {
    try {
      var res = await DioProvider.get(endPoint: ApiEndpoints.productBestSeller);

      if (res.statusCode == 200) {
        return BestSellerResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  } // method

  static Future<SliderResponse?> getSliders() async {
    try {
      var res = await DioProvider.get(endPoint: ApiEndpoints.sliders);

      if (res.statusCode == 200) {
        return SliderResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}// class 
