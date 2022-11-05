import 'package:flutter_task/app/modules/home/cart/cart_view.dart';
import 'package:flutter_task/app/modules/home/favorites/favorites_bindings.dart';
import 'package:flutter_task/app/modules/home/favorites/favorites_view.dart';
import 'package:flutter_task/app/modules/home/grocery/grocery_view.dart';
import 'package:flutter_task/app/modules/home/main_home/main_home_bindings.dart';
import 'package:flutter_task/app/modules/home/news/news_bindings.dart';
import 'package:flutter_task/app/modules/home/news/news_view.dart';
import 'package:get/get.dart';
import 'cart/cart_bindings.dart';
import 'grocery/grocery_bindings.dart';
import 'main_home/main_home_view.dart';
import 'shared/constant/home_routes.dart';

part 'shared/home_pages.dart';

class HomeModule {
  static String get homeInitialRoute => HomeRoutes.mainRoute;
  static List<GetPage> get homePages => _HomePages.homePages;
}
