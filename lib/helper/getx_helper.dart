import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxHelper {
  static void showSnackBar1({required String title, required String message}) {
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.black,
        animationDuration: const Duration(seconds: 1));
  }
}
