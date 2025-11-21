import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_bookia/core/constants/app_images.dart';
import 'package:my_bookia/core/utils/app_colors.dart';
import 'package:my_bookia/features/home/presentation/pages/home_screen.dart';
import 'package:my_bookia/features/wishlist/presentation/pages/wishlist_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    WishlistScreen(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          navBarItem(path: AppImages.homeSvg, label: 'Home'),
          navBarItem(path: AppImages.bookmarkSvg, label: 'BookMark'),
          navBarItem(path: AppImages.cardSvg, label: 'Card'),
          navBarItem(path: AppImages.profilekSvg, label: 'Profile'),
        ],
      ),
    );
  }

  BottomNavigationBarItem navBarItem({
    required String path,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        path,
        colorFilter: ColorFilter.mode(AppColors.primayColor, BlendMode.srcIn),
      ),
      icon: SvgPicture.asset(path),
      label: label,
    );
  }
}
