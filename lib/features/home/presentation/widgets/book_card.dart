import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/routes/navigations.dart';
import 'package:my_bookia/core/routes/routs.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/main_button.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/product.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, Routs.details, extra: product);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: product.id ?? 0,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: Image.network(
                    product.image ?? '',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, StackTrace) {
                      return Image.asset(
                        AppImages.welcome,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
            ),

            Gap(10),

            SizedBox(
              height: 40,
              child: Text(
                product.name ?? "        ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.styleSize16,
              ),
            ),
            Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${product.priceAfterDiscount}',
                  style: TextStyles.styleSize16,
                ),
                Gap(10),
                MainButton(
                  label: 'Buy',
                  width: 80,
                  height: 30,
                  bgColor: AppColors.darkColor,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
