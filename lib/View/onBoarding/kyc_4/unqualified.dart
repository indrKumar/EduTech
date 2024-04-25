import 'package:edushalaacademy/View/onBoarding/kyc_4/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class UnqualifiedScreen extends StatefulWidget {
  const UnqualifiedScreen({super.key});

  @override
  State<UnqualifiedScreen> createState() => _UnqualifiedScreenState();
}

class _UnqualifiedScreenState extends State<UnqualifiedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: Container(
            // width: SizeUtils.width,
            // height: SizeUtils.height,
            padding: EdgeInsets.only(top: 56.w),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(0, -0.01),
                    end: Alignment(1.03, 1.02),
                    colors: [appTheme.gray900, appTheme.greenA70001])),
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 123.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text("Oh Sorry!",
                              textAlign: TextAlign.center,
                              style: CustomTextStyles
                                  .displayMediumPrimaryContainer50)),
                      SizedBox(height: 6.w),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin:
                              EdgeInsets.only(left: 38.h, right: 40.h),
                              child: Text("You didn’t qualified for the applied categories.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyles
                                      .bodyLargePrimaryContainer18))),
                      SizedBox(height: 117.w),
                      Padding(
                          padding: EdgeInsets.only(left: 33.h),
                          child: Text("Evaluators Feedback",
                              style: CustomTextStyles
                                  .bodyLargePrimaryContainer18)),
                      SizedBox(height: 13.w),
                      Container(
                          width: 289.h,
                          margin: EdgeInsets.only(left: 36.h, right: 63.h),
                          child: Text("1. You need to work upon your\n  commnication skills.1.\n"
                              "2. You need to work in your maths basics.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .bodyMediumMontserratPrimaryContainer)),
                      SizedBox(height: 141.w),
                      _buildSix()
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimarycontainer,
            margin: EdgeInsets.fromLTRB(21.h, 22.w, 362.h, 22.w),
            onTap: () {
              onTapArrowLeft();
            }));
  }

  Widget _buildSix() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 24.w),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("You can re-apply after 12/02/2024",
                  style: CustomTextStyles.bodyMediumMontserrat_1)),
          SizedBox(height: 15.w),
          CustomElevatedButton(
              text: "Re-apply with Same Data",
              margin: EdgeInsets.only(left: 14.h, right: 19.h),
              buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_1),
          SizedBox(height: 17.w),
          CustomElevatedButton(
            onPressed: () {
              Get.to(()=>const ResultScreen());
            },
              text: "Clear Old Date & Re-apply",
              margin: EdgeInsets.only(left: 14.h, right: 19.h),
              buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3),
          SizedBox(height: 7.w)
        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
