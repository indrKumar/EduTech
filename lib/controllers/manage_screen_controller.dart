import 'package:get/get.dart';
class MyController extends GetxController {
  var isIndicatorVisible = false.obs;

  void showCircularProgress() {
    isIndicatorVisible.value = true;
  }

  void hideCircularProgress() {
    isIndicatorVisible.value = false;
  }
}