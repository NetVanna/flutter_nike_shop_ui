import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_shoe_app_ui/utils/constants.dart';
import 'package:nike_shoe_app_ui/view/user_profile/user_profile_view.dart';

import 'bag/bag_view.dart';
import 'home/home_view.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();
  final List<Widget> _screens = [
    const HomeView(),
    const BagView(),
    const UserProfileView(),
  ];
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // _pageController.jumpToPage(_selectedIndex);
    _pageController.animateToPage(
      _selectedIndex,
      duration: const Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        iconSize: 30,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.shopping_cart)),
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.person)),
        ],
      ),
    );
  }
}
