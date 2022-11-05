import 'package:flutter_task/app/modules/home/grocery/grocery_controller.dart';
import 'package:get/get.dart';

class GroceryBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GroceryController());
  }
}
