import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import 'main_home_controller.dart';

class MainHomeView extends GetView<MainHomeController> {
  const MainHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeController>(
      builder: (_) => Scaffold(
        body: controller.screens[controller.currentPage],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('\$ ${controller.totalPrice}'),
              const Icon(Icons.shopping_cart_outlined)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          onTap: (page) => controller.changePage(page),
          activeIndex: controller.currentPage,
          notchSmoothness: NotchSmoothness.defaultEdge,
          icons: const [
            Icons.shop_2,
            Icons.notifications_none,
            Icons.favorite_border_outlined,
            Icons.account_balance_wallet_outlined
          ],
          backgroundColor: ConstColors.backgroundBottomNavigationBarColor,
          activeColor: ConstColors.primaryColor,
          inactiveColor: ConstColors.greyColor,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
        ),
      ),
    );
  }
}
