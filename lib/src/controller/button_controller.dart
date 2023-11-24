import 'package:get/get.dart';

class ButtonController extends GetxController {
  static ButtonController get find => Get.find();

  RxBool isLoading = false.obs;

  Future setLoading(context, onClick) async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    onClick();
    await Future.delayed(const Duration(milliseconds: 100));
    isLoading.value = false;
  }
}
