import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.logoSvg, height: 30),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.searchSvg),
          ),
        ],
      ),

      body: Padding(
        padding: AppConstants.bodyPadding,
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.welcome,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
              options: CarouselOptions(
                height: 150,
                // aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Gap(15),
            SmoothPageIndicator(
              controller: PageController(),
              count: 6,
              axisDirection: Axis.horizontal,
              effect: ExpandingDotsEffect(
                spacing: 5,
                radius: 4.0,
                dotWidth: 7,
                dotHeight: 7,
                expansionFactor: 4,
                dotColor: AppColors.backgroundColor,

                activeDotColor: AppColors.primayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
