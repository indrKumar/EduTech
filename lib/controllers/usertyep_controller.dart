import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTypeController extends GetxController {
  RxBool isTeacher = false.obs;

  Future<void> checkUserType() async {
    final prefs = await SharedPreferences.getInstance();
    isTeacher.value = prefs.getBool('isTeacher') ?? false;
  }

  Future<void> setUserType(bool isTeacher) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isTeacher', isTeacher);
    this.isTeacher.value = isTeacher;
  }
}
