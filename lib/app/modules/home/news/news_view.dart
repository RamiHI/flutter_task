import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/home/news/news_controller.dart';
import 'package:get/get.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('News'),
      ),
    );
  }
}
