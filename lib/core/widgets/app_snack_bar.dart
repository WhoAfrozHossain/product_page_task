import 'package:product_page_task/core/apphelper/app_helper.dart';
import 'package:product_page_task/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  static showErrorMessage({String? title, String? message}) {
    AppHelper.snackBarKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      backgroundColor: ColorManager.error,
      content: Text(
        message ?? "",
        style: TextStyle(color: ColorManager.white),
      ),
      dismissDirection: DismissDirection.endToStart,
    ));
  }

  static showSuccessMessage({String? title, String? message}) {
    AppHelper.snackBarKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: ColorManager.primaryOpacity70,
      content: Text(
        message ?? "",
        style: TextStyle(color: ColorManager.white),
      ),
      dismissDirection: DismissDirection.endToStart,
    ));
  }
}
