import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/home/favorites/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('FavoritesView'),
      ),
    );
  }
}
