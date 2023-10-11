import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'main_text.dart';

class MainNavBar extends StatelessWidget {
  const MainNavBar({
    super.key,
    required this.index,
  });

  final int? index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: index!,
      onTap: (value) {},
      selectedItemColor: AppColors.yPrimaryColor,
      unselectedItemColor: AppColors.yGreyColor,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart_outlined),
              Positioned(
                  top: -3,
                  right: -3,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: AppColors.yRedColor,
                    child: MainText(
                      '2',
                      color: AppColors.yWhiteColor,
                      fontSize: 10,
                    ),
                  ))
            ],
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_outlined),
          label: 'Offer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Account',
        ),
      ],
    );
  }
}
