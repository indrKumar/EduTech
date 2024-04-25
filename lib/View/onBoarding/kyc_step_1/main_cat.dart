import 'package:edushalaacademy/View/onBoarding/kyc_step_1/select_cat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../controllers/kyc_one/step_controller.dart';

class MainScreen extends StatefulWidget {

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final StepController _homeController = Get.put(StepController());
@override
  void initState() {
  _homeController.fetchCategoriesParent();
    // TODO: implement initState
    super.initState();
  }
  EducationController educationController = Get.put(EducationController());

  @override
  Widget build(BuildContext context) {
    educationController.submitKycStatus(id: 2).then((value) {
      print(value);
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(() => LinearProgressIndicator(
          value: (_homeController.selectedIndex.value + 1) / _homeController.subCategories.length,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        )),
      ),
      // body:

      // SelectCategory(title:_homeController.subCategories[_homeController.selectedIndex.value].type,id: _homeController.subCategories[_homeController.selectedIndex.value].id.toString(),)
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Obx(() => Text(_homeController.categories[_homeController.selectedIndex.value]["name"])),
      //       ElevatedButton(
      //         onPressed: () {
      //           int newIndex = (_homeController.selectedIndex.value + 1) % _homeController.categories.length;
      //           _homeController.selectedIndex.value = newIndex;
      //         },
      //         child: const Text('Next Page'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
