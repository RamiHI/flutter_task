import 'package:flutter_task/app/modules/home/news/news_controller.dart';
import 'package:get/get.dart';

class NewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NewsController());
  }
}
