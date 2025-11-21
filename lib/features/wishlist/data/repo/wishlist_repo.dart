import 'dart:developer';

import 'package:my_bookia/core/services/api/api_endpoints.dart';
import 'package:my_bookia/core/services/api/dio_provider.dart';

import 'package:my_bookia/core/services/local/shared_pref.dart';
import 'package:my_bookia/features/wishlist/data/models/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<WishlistResponse?> getWishlist() async {
    try {
      var res = await DioProvider.get(
        endPoint: ApiEndpoints.wishlist,
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );

      if (res.statusCode == 200) {
        return WishlistResponse.fromJson(res.data);
        // success
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishlistResponse?> removeFromWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        endPoint: ApiEndpoints.removeFromWishlist,
        data: {"product_id": productId},
        headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
      );

      if (res.statusCode == 200) {
        return WishlistResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
