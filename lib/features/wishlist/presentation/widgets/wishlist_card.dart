import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/features/wishlist/data/models/wishlist_response/datum.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.book, required this.onRemove});
  final WishlistProduct book;
  final Function() onRemove;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        //Remove item from Wishlist
        onRemove();
      },
      background: Container(
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: AppConstants.bodyPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.delete, color: Colors.white)],
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 140,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Hero(
              tag: UniqueKey(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  book.image ?? "",
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.welcome,
                      width: 100,
                      height: 120,
                    );
                  },
                ),
              ),
            ),
            Gap(15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.name ?? "", style: TextStyles.styleSize16),
                  Gap(10),
                  Text('\$   ${book.price}  ', style: TextStyles.styleSize18),
                  Gap(10),
                  Text(
                    book.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.styleSize16.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
