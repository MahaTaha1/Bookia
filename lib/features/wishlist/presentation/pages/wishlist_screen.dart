import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:my_bookia/core/constants/app_constants.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/constants/app_strings.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/core/utils/text_styles.dart';
import 'package:my_bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:my_bookia/features/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:my_bookia/features/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishlist(),
      child: Scaffold(
        appBar: AppBar(title: Text('Wishlist'), centerTitle: true),

        body: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            var cubit = context.read<WishlistCubit>();
            //state is success and  list is embty
            if (cubit.books.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppImages.bookmarkSvg,
                      width: 100,
                      height: 100,
                      colorFilter: ColorFilter.mode(
                        AppColors.primayColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    Gap(20),
                    Text(
                      AppStrings.noBooksInWishist,
                      style: TextStyles.styleSize16,
                    ),
                  ],
                ),
              );
            }

            return Skeletonizer(
              enabled: state is! WishlistSuccessState,
              child: ListView.separated(
                padding: AppConstants.bodyPadding,
                itemCount: cubit.books.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return WishlistCard(
                    book: cubit.books[index],
                    onRemove: () {
                      cubit.removeFromWishlist(
                        productId: cubit.books[index].id ?? 0,
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
