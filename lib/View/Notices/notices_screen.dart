import 'package:edushalaacademy/View/Notices/notice_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';

// ignore_for_file: must_be_immutable
class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 30.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Notices(11)",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              SizedBox(height: 19.w),
              Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "Today",
                  style: CustomTextStyles.labelLargeBlack900_4,
                ),
              ),
              SizedBox(height: 12.w),
              _buildUserProfile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5.w),
            child: SizedBox(
              width: 350.h,
              child: Divider(
                height: 1.w,
                thickness: 1.w,
                color: appTheme.black900.withOpacity(0.1),
              ),
            ),
          );
        },
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(()=>const NoticesDetailsScreen());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 248.h,
                  child: Text(
                    "There are many variations of Lore.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelLargeBlack900_4,
                  ),
                ),
                const Text(
                    "10 min ago ",
                    style: TextStyle(
                        fontSize: 10
                    )
                ),
                Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgGraphicDesign44x45,
                      height: 44.w,
                      width: 45.h,
                      radius: BorderRadius.circular(
                        5.h,
                      ),
                      margin: EdgeInsets.only(top: 3.w),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 3.w),
                            const Text(
                              "Dear Educators, As you are already aware, we have approached in the final stretch of this academic year and We firmly acknowledge your... ",
                              style: TextStyle(
                                fontSize: 10
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
// Widget _buildBottomBar() {
//   return CustomBottomBar(
//     onChanged: (BottomBarEnum type) {
//       Get.toNamed(getCurrentRoute(type), id: 1);
//     },
//   );
// }

  ///Handling route based on bottom click actions
// String getCurrentRoute(BottomBarEnum type) {
//   switch (type) {
//     case BottomBarEnum.Home:
//       return AppRoutes.educationalQualificationListPage;
//     case BottomBarEnum.Classes:
//       return "/";
//     case BottomBarEnum.Newleads:
//       return "/";
//     case BottomBarEnum.Notices:
//       return "/";
//     case BottomBarEnum.Profile:
//       return "/";
//     default:
//       return "/";
//   }
// }

// ///Handling page based on route
// Widget getCurrentPage(String currentRoute) {
//   switch (currentRoute) {
//     case AppRoutes.educationalQualificationListPage:
//       return EducationalQualificationListPage();
//     default:
//       return DefaultWidget();
//   }
// }
}
