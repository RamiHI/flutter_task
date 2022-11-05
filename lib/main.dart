import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/app/core/models/cart/cart_model.dart';
import 'package:flutter_task/app/core/models/favorite/favorite_model.dart';
import 'package:flutter_task/app/modules/home/home_module.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/core/services/local/hive_keys.dart';
import 'app/core/theme/theme.dart';
import 'app_pages.dart';

part 'app_initialize.dart';

void main() async {
  await _preInitializations();
  return runApp(GetMaterialApp(
    initialRoute: HomeModule.homeInitialRoute,
    getPages: AppPages.appRoutes,
    debugShowCheckedModeBanner: false,
    theme: CustomTheme.lightTheme,
    builder: BotToastInit(),
    navigatorObservers: [BotToastNavigatorObserver()],
  ));
}
