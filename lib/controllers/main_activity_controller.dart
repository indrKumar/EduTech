import 'package:get/get.dart';

import '../models/student_class_model.dart';
import 'StudentController/pakege_details_controller.dart';

class MainActivityController extends GetxController {
  var tabIndex = 0.obs;

  final PackageDetails controller = Get.put(PackageDetails());

  late Future<List<StudentClassM>> futureStudentData;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    futureStudentData = controller.fetchStudentData();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}