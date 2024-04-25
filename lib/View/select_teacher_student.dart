import 'package:edushalaacademy/View/auth/loging_send.dart';
import 'package:edushalaacademy/View/overview/over_view_screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/usertyep_controller.dart';
import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/image_constant.dart';
import '../utils/store_local_data.dart';

class SelectTeacherOrParent extends StatefulWidget {
  const SelectTeacherOrParent({super.key});

  @override
  State<SelectTeacherOrParent> createState() => _SelectTeacherOrParentState();
}

class _SelectTeacherOrParentState extends State<SelectTeacherOrParent> {
  final UserTypeController userTypeController = Get.put(UserTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWhatDefinesYou(),
            26.h.verticalSpace,
            _buildIMATeacher(),
            23.h.verticalSpace,
            _buildIMAParentStudent(),
            SizedBox(height: 42.h),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 65),
                child: Text(
                  "Kindly make sure you select the correct option which defines you best. You can’t switch it later."
                      .tr,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallBlack900_2,
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget _buildWhatDefinesYou() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        // height: 402.h,
        width: double.maxFinite,
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              top: 140.h,
              right: 59.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What defines you best?",
                  style: CustomTextStyles.titleLargeBlack900Bold,
                ),
                SizedBox(height: 6.h),
                SizedBox(
                  width: 311.h,
                  child: Text(
                    "Continue with the option which defines you best",
                    style: CustomTextStyles.titleSmallBlack900_1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIMATeacher() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: 16.h,
          right: 24.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.2),
                offset: const Offset(1, 1),
                spreadRadius: 03),
            BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.2),
                offset: const Offset(-1, -1),
                spreadRadius: 03),
          ],
          color: Colors.white,
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        bottom: 17.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I’m a".tr,
                                  style: CustomTextStyles.bodyLargeff00000018,
                                ),
                                const TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "Teacher".tr,
                                  style: CustomTextStyles.titleMediumff00c1ff,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            // width: 130.h,
                            child: Text(
                              "Looking for part time offline/online home tuition opportunities",
                              style: CustomTextStyles.titleSmallBlack900_3
                                  .copyWith(
                                height: 1.21,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    ImageConstant.imgUndrawTeachingReG7e3,
                    height: 124.h,
                    width: 168,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 29),
            GetBuilder<UserTypeController>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: _buildContinueVar(
                  onTap: () async {
                    await userTypeController.setUserType(true);
                    Get.to(OverviewThreeOneScreen())?.then((value) async {
                      SharedPref.setStringSp(SharedPref.TYPOFUSER, "teacher");
                      if (kDebugMode) {
                        print("TEACHERRRRRRR");
                      }
                    });
                  },
                  continueVar: "Continue",
                ),
              ),
            ),
            const SizedBox(height: 11),
          ],
        ),
      ),
    );
  }

  Widget _buildIMAParentStudent() {
    return GetBuilder<UserTypeController>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 24,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 23,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.2),
                offset: const Offset(1, 1),
                spreadRadius: 03),
            BoxShadow(
                color: theme.colorScheme.primary.withOpacity(0.2),
                offset: const Offset(-1, -1),
                spreadRadius: 03),
          ],
          color: Colors.white,
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset(
                        ImageConstant.imgUndrawQualityTimeWiyl),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 3,
                        right: 70,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I’m a",
                                  style: CustomTextStyles.bodyLargeff00000018,
                                ),
                                const TextSpan(
                                  text: " ",
                                ),
                                TextSpan(
                                  text: "Guardian/Student",
                                  style: CustomTextStyles.titleMediumff00c1ff,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 7),
                          SizedBox(
                            child: Text(
                              "Looking for tutors \nwho can teach me/\nmy kid.",
                              style: CustomTextStyles.titleSmallBlack900_3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 29.h),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: _buildContinueVar(
                onTap: () async {
                  await userTypeController.setUserType(false);
                  Get.to(() => LoginMobileScreen(
                        type: "parent",
                      ))?.then((value) => (value) {
                        SharedPref.setStringSp(SharedPref.TYPOFUSER, "parent");
                      });
                },
                continueVar: "Continue",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueVar({required String continueVar, onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              continueVar,
              style: CustomTextStyles.bodyLargePrimary.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: theme.colorScheme.primary,
            )
          ],
        ),
      ),
    );
  }
}
