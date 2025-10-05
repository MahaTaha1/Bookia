import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/core/widgets/main_button.dart';

class BestSellerBuilder extends StatelessWidget {
  const BestSellerBuilder({super.key});

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
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: .55,
            // mainAxisExtent: 280, // ارتفاع كل عنصر
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10),
                      child: Image.asset(
                        AppImages.welcome,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Gap(10),

                  SizedBox(
                    height: 40,
                    child: Text(
                      index == 0
                          ? 'Book Name name name name name name'
                          : 'Book Name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.styleSize16,
                    ),
                  ),
                  Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$20', style: TextStyles.styleSize16),
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
            );
          },
        ),
      ],
    );
  }
}
