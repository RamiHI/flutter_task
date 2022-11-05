import 'package:flutter_task/app/modules/home/favorites/favorites_bindings.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_bindings.dart';
import 'package:flutter_task/app/modules/home/main_home/main_home_controller.dart';
import 'package:flutter_task/app/modules/home/news/news_bindings.dart';
import 'package:get/get.dart';

import '../cart/cart_bindings.dart';

class MainHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainHomeController(), permanent: true);

    GroceryBindings().dependencies();
    NewsBindings().dependencies();
    FavoritesBindings().dependencies();
    CartBindings().dependencies();
  }
}
