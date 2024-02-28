import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class CheckUpdateController extends GetxController {
  static CheckUpdateController get find => Get.find();

  FirebaseRemoteConfig? remoteConfig;
  RxBool animating = false.obs;
  RxBool animated = false.obs;
  RxBool updated = false.obs;
  RxBool downloadUpdate = false.obs;
  RxBool isLoading = false.obs;

  Future setupRemoteConfig(context) async {
    remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig?.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    try {
      await remoteConfig?.fetchAndActivate();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error fetching'),
        ),
      );
    }
  }

  Future startAnimation(context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    animating.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    animated.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    setupRemoteConfig(context);
    String? latestVersion = remoteConfig?.getString("latest_version");
    if (latestVersion == "1.0.0") {
      updated.value = true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Update Application!'),
        ),
      );
    }
  }
}
