import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app.dart';

void showSnack(String title, message, [SnackType snackType = SnackType.info, int duration = 3]) {
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: duration),
    snackPosition: SnackPosition.TOP,
    colorText: Colors.white,
    backgroundColor: _getSnackBgColor(snackType),
    margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 65),
  );
}

Color _getSnackBgColor(SnackType snackType) {
  if (snackType == SnackType.warning) {
    return Colors.amber.shade600;
  }
  if (snackType == SnackType.error) {
    return Colors.red.shade700;
  }

  return Colors.green.shade600;
}
