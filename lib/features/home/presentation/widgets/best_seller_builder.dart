import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:my_bookia/features/home/presentation/widgets/book_card.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.bestSeller, style: TextStyles.styleSize24),
        Gap(20),

        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .55,
            // mainAxisExtent: 280, // ارتفاع كل عنصر
          ),
          itemBuilder: (context, index) {
            return BookCard(product: products[index]);
          },
        ),
      ],
    );
  }
}
