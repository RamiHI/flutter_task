import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/services/local/get_boxes.dart';
import 'package:flutter_task/app/modules/home/cart/cart_view.dart';
import 'package:flutter_task/app/modules/home/favorites/favorites_view.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_view.dart';
import 'package:flutter_task/app/modules/home/news/news_view.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MainHomeController extends GetxController {
  late List<Widget> screens;
  int currentPage = 0;
  late Box<CartModel> cartBox;
  int totalPrice = 0;

  @override
  void onInit() {
    screens = [
      const GroceryView(),
      const NewsView(),
      const FavoritesView(),
      const CartView()
    ];
    cartBox = Boxes.getCart();
    calculateTotalPrice();
    super.onInit();
  }

  void changePage(int index) {
    currentPage = index;
    update();
  }

  void calculateTotalPrice() {
    totalPrice = 0;
    List<CartModel> cart = cartBox.values.cast<CartModel>().toList();
    if (cart.isNotEmpty) {
      for (CartModel cartModel in cart) {
        totalPrice = totalPrice + (int.parse(cartModel.price!) * cartModel.count!);
      }
      update();
    }
  }
}
