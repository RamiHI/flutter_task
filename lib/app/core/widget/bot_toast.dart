import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/constants/colors.dart';

class CustomToast {
  CustomToast.showDefault(String message) {
    BotToast.closeAllLoading();
    showToast(message);
  }

  CustomToast.showLoading() {
    showLoading();
  }

  void showToast(String message) {
    BotToast.showText(
      text: message,
      textStyle: TextStyle(
        overflow: TextOverflow.visible,
        fontWeight: FontWeight.w500,
        color: ConstColors.blackColor,
      ),
      contentColor: ConstColors.backgroundColor,
      crossPage: false,
      clickClose: true,
      duration: const Duration(seconds: 5),
    );
  }

  void showLoading() {
    BotToast.showLoading();
  }

  CustomToast.closeLoading() {
    closeLoading();
  }

  void closeLoading() {
    BotToast.closeAllLoading();
  }
}
