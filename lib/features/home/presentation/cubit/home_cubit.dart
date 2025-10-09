import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/best_seller_response.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:my_bookia/features/home/data/models/slider_response/slider.dart';
import 'package:my_bookia/features/home/data/models/slider_response/slider_response.dart';
import 'package:my_bookia/features/home/data/repo/home_repo.dart';
import 'package:my_bookia/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Product> products = [Product(), Product(), Product()];

  List<SliderModel> sliders = [SliderModel(), SliderModel(), SliderModel()];

  fetchHomeData() async {
    emit(HomeLoadingState());

    try {
      final sliderFuture = HomeRepo.getSliders();
      final bestSellerFuture = HomeRepo.getBestSeller();
      final results = await Future.wait([sliderFuture, bestSellerFuture]);

      final slider = results[0] as SliderResponse?;
      final bestSeller = results[1] as BestSellerResponse?;

      if (slider != null && bestSeller != null) {
        sliders = slider.data?.sliders ?? [];
        products = bestSeller.data?.products ?? [];
        emit(HomeSuccessState());
      } else {
        emit(HomeErorrState());
      }
    } catch (e) {
      emit(HomeErorrState());
    }

    // getBestSeller() async {
    //   emit(HomeLoadingState());

    //   var res = await HomeRepo.getBestSeller();
    //   if (res != null) {
    //     products = res.data?.products ?? [];
    //     emit(HomeSuccessState());
    //   } else {
    //     emit(HomeErorrState());
    //   }
    // }

    // getSlider() async {
    //   emit(HomeLoadingState());
    //   var res = await HomeRepo.getSliders();
    //   if (res != null) {
    //     sliders = res.data?.sliders ?? [];
    //     emit(HomeSuccessState());
    //   } else {
    //     emit(HomeErorrState());
    //   }
    // }
  } // class
}
