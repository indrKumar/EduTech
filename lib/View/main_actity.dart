import 'package:edushalaacademy/View/ClassMenagement/class_menagement.dart';
import 'package:edushalaacademy/View/Leads/leads_tabs_screens.dart';
import 'package:edushalaacademy/View/Notices/notices_screen.dart';
import 'package:edushalaacademy/View/Profile/profile.dart';
import 'package:edushalaacademy/View/widgets/custom_bottom_bar.dart';
import 'package:edushalaacademy/View/widgets/custom_image_view.dart';
import 'package:edushalaacademy/controllers/main_activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/image_constant.dart';
import 'Home/home.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgHome,
      activeIcon: ImageConstant.imgHome,
      title: "Home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettingsGray30002,
      activeIcon: ImageConstant.imgSettingsGray30002,
      title: "Classes".tr,
      type: BottomBarEnum.Classes,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgMegaphone,
      activeIcon: ImageConstant.imgMegaphone,
      title: "New Leads".tr,
      type: BottomBarEnum.Newleads,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUser,
      title: "Payments".tr,
      type: BottomBarEnum.Notices,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettings,
      title: "Profile".tr,
      type: BottomBarEnum.Profile,
    )
  ];
  final MainActivityController landingPageController =
      Get.put(MainActivityController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomePage(),
              ClassManagement(),
              LeadsTabScreens(),
              NoticesScreen(),
              ProfilePage()
              // PlacesPage(),
              // SettingsPage(),
            ],
          )),
    );
  }

  buildBottomNavigationMenu(context, landingPageController) {
    return Container(
      height: 81.w,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.h),
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.13),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              3,
              -6,
            ),
          ),
        ],
      ),
      child: Obx(
        () => BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          currentIndex: landingPageController.tabIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].icon,
                    height: 22.w,
                    width: 23.h,
                    color: appTheme.gray30002,
                    radius: BorderRadius.circular(
                      3.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.w),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.labelLarge!.copyWith(
                        color: appTheme.black900.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 22.w,
                    width: 21.h,
                    color: theme.colorScheme.primary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.w),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: CustomTextStyles.labelLargePrimary_1.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              label: '',
            );
          }),
          onTap: landingPageController.changeTabIndex,
        ),
      ),
    );
  }
}
