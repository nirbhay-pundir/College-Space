import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/sign_in.dart';

class CheckUpdateController extends GetxController {
  static CheckUpdateController get find => Get.find();

  RxBool animating = false.obs;
  RxBool animated = false.obs;
  RxBool updated = false.obs;
  RxBool downloadUpdate = false.obs;
  RxBool isLoading = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animating.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    // TODO: Check for network connectivity and update, if available download
    animated.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    updated.value = true;
  }

  Future setLoading(context) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.pushNamed(
      context,
      SignIn.route,
    );
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading.value = false;
  }
}
