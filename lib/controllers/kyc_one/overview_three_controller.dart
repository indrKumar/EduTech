import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OverviewThreeController extends GetxController {
  int currentPage = 0;
  PageController pageController = PageController();


  void changePage(int index) {
    currentPage = index;
    update(); // Notify listeners that the state has changed
  }

  void goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
