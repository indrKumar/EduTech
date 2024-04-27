import 'package:edushalaacademy/View/Student/Student_main/payment_st.dart';
import 'package:edushalaacademy/View/Student/Student_main/profile/profile_s.dart';
import 'package:edushalaacademy/View/Student/Student_main/reports/reports_page.dart';
import 'package:edushalaacademy/View/Student/Student_main/st_home_page.dart';
import 'package:flutter/material.dart';

import '../../../theme/theme_helper.dart';
import 'attendance/attandance.dart';

class MainActivityStudent extends StatefulWidget {
  const MainActivityStudent({super.key});

  @override
  State<MainActivityStudent> createState() => _MainActivityStudentState();
}

class _MainActivityStudentState extends State<MainActivityStudent> {
  // List<BottomMenuModel> bottomMenuList = [
  //   BottomMenuModel(
  //     icon: ImageConstant.imgHome,
  //     activeIcon: ImageConstant.imgHome,
  //     title: "Home",
  //     type: BottomBarEnum.Home,
  //   ),
  //   BottomMenuModel(
  //     icon: ImageConstant.imgSettingsGray30002,
  //     activeIcon: ImageConstant.imgSettingsGray30002,
  //     title: "Students",
  //     type: BottomBarEnum.Classes,
  //   ),
  //   BottomMenuModel(
  //     icon: ImageConstant.imgMegaphone,
  //     activeIcon: ImageConstant.imgMegaphone,
  //     title: "Reports",
  //     type: BottomBarEnum.Newleads,
  //   ),
  //   BottomMenuModel(
  //     icon: ImageConstant.imgUser,
  //     activeIcon: ImageConstant.imgUser,
  //     title: "Payments".tr,
  //     type: BottomBarEnum.Notices,
  //   ),
  //   BottomMenuModel(
  //     icon: ImageConstant.imgSettings,
  //     activeIcon: ImageConstant.imgSettings,
  //     title: "Profile".tr,
  //     type: BottomBarEnum.Profile,
  //   )
  // ];
  // static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    StHomePage(),
    AttendanceTab(),
    ReportsPageS(),
    PaymentStScreen(),
    ProfilePageS(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
                // showSelectedLabels: false,
                showUnselectedLabels: true,
                selectedFontSize: 0,
        selectedLabelStyle:  theme.textTheme.labelLarge!.copyWith(
                            color: appTheme.black900.withOpacity(0.7)),
        unselectedItemColor: const Color(0xFFDBDBDB),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,

        selectedItemColor: theme.colorScheme.primary,

        onTap: _onItemTapped,
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar:
  //         buildBottomNavigationMenu(context, landingPageController),
  //     body: _widgetOptions.elementAt(_selectedIndex),
  //     );
  // }

  // buildBottomNavigationMenu(context, landingPageController) {
  //   return Container(
  //     height: 81.w,
  //     decoration: BoxDecoration(
  //       color: theme.colorScheme.primaryContainer.withOpacity(1),
  //       borderRadius: BorderRadius.vertical(
  //         top: Radius.circular(10.h),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: appTheme.black900.withOpacity(0.13),
  //           spreadRadius: 2.h,
  //           blurRadius: 2.h,
  //           offset: const Offset(
  //             3,
  //             -6,
  //           ),
  //         ),
  //       ],
  //     ),
  //     child:  BottomNavigationBar(
  //         backgroundColor: Colors.transparent,
  //         showSelectedLabels: false,
  //         showUnselectedLabels: false,
  //         selectedFontSize: 0,
  //       currentIndex: _selectedIndex,
  //       selectedItemColor: Colors.amber[800],
  //       onTap: _onItemTapped,
  //         elevation: 0,
  //         // currentIndex: currentIndex,
  //         type: BottomNavigationBarType.fixed,
  //         items: List.generate(bottomMenuList.length, (index) {
  //           return BottomNavigationBarItem(
  //
  //             icon: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 CustomImageView(
  //                   imagePath: bottomMenuList[index].icon,
  //                   height: 22.w,
  //                   width: 23.h,
  //                   color: appTheme.gray30002,
  //                   radius: BorderRadius.circular(
  //                     3.h,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(top: 4.w),
  //                   child: Text(
  //                     bottomMenuList[index].title ?? "",
  //                     style: theme.textTheme.labelLarge!.copyWith(
  //                       color: appTheme.black900.withOpacity(0.7),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             activeIcon: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 CustomImageView(
  //                   imagePath: bottomMenuList[index].activeIcon,
  //                   height: 22.w,
  //                   width: 21.h,
  //                   color: theme.colorScheme.primary,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.only(top: 5.w),
  //                   child: Text(
  //                     bottomMenuList[index].title ?? "",
  //                     style: CustomTextStyles.labelLargePrimary_1.copyWith(
  //                       color: theme.colorScheme.primary,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             label: '',
  //           );
  //         }),
  //         // onTap: (value) {
  //         //   setState(() {
  //         //     currentIndex = value;
  //         //   });
  //         // },
  //
  //       ),
  //   );
  // }
}
