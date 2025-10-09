import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/app_bar_with_back.dart';
import 'package:my_bookia/core/widgets/main_button.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/product.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        action: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.bookmarkSvg),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Hero(
                  tag: product.id ?? 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image ?? '',
                      width: 200,
                      height: 270,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppImages.welcome,
                          width: 180,
                          height: 270,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),

                Gap(20),
                Text(product.name ?? '', style: TextStyles.styleSize24),
                Gap(10),
                Text(
                  product.category ?? '',
                  style: TextStyles.styleSize16.copyWith(
                    color: AppColors.primayColor,
                  ),
                ),
                Gap(10),
                Text(
                  product.description ?? '',
                  textAlign: TextAlign.justify,
                  style: TextStyles.styleSize14,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppConstants.bodyPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.priceAfterDiscount}',
                style: TextStyles.styleSize24,
              ),
              Gap(10),
              MainButton(
                label: 'Add to Cart',
                width: 200,
                // height: 30,
                bgColor: AppColors.darkColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
