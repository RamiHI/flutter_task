import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/widget/bot_toast.dart';
import 'package:flutter_task/app/modules/home/main_home/main_home_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  void addQuantityItem(CartModel cartModel) async {
    cartModel.count = (cartModel.count! + 1);
    await cartModel.save();
    MainHomeController mainHomeController = Get.find<MainHomeController>();
    mainHomeController.calculateTotalPrice();
    CustomToast.showDefault('Items have been increased by cart');
  }

  void minusQuantityItem(CartModel cartModel) async {
    if (cartModel.count! > 1) {
      cartModel.count = (cartModel.count! - 1);
      await cartModel.save();
      CustomToast.showDefault('Items have been reduced by cart');
    } else {
      await cartModel.delete();
      CustomToast.showDefault('Item has been deleted');
    }
    MainHomeController mainHomeController = Get.find<MainHomeController>();
    mainHomeController.calculateTotalPrice();
  }
}
