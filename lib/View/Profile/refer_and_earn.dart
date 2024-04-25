import 'package:dotted_border/dotted_border.dart';
import 'package:edushalaacademy/View/Profile/refer_earn_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
              children: [
                _buildUndrawSavingsReEqw(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  child: Column(children: [
                    // SizedBox(height: 9.h),
                    SizedBox(height: 15.h),
                    Text("Your Referral Code",
                        style: CustomTextStyles.bodyLargeInterPrimary18),
                    SizedBox(height: 14.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 55.w),
                        child: DottedBorder(
                            color: appTheme.black900.withOpacity(0.6),
                            padding: EdgeInsets.only(
                                left: 2.w, top: 2.h, right: 2.w, bottom: 2.h),
                            strokeWidth: 2.w,
                            dashPattern: const [6, 3],
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 51.w, vertical: 6.h),
                                decoration: AppDecoration.outlineBlack90021,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 1.h),
                                      Text("AAHHDH",
                                          style:
                                              CustomTextStyles.headlineLargeBlack900)
                                    ])))),
                    SizedBox(height: 11.h),
                    Text("TAP TO COPY",
                        style: CustomTextStyles.bodySmallInterBlack900_2),
                    SizedBox(height: 23.h),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Terms & Conditions",
                            style: CustomTextStyles.labelLargeInterLightblueA400
                                .copyWith(decoration: TextDecoration.underline))),
                    SizedBox(height: 13.h),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            width: 315.w,
                            margin: EdgeInsets.only(left: 4.w, right: 30.w),
                            child: Text(
                                "Referred person must be unique and not verified as a tutor with Edushala.Ensure the referred individual completes the full onboarding process for validation.",
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.bodySmallInterGray400
                                    .copyWith(height: 1.48))))
                  ]),
                ),
              ],
                        ),
            ),
            _buildAppBar(),
          ]
        ),
        bottomNavigationBar: _buildShareApp());
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.w,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftPrimarycontainer,
            margin: EdgeInsets.only(left: 21.w, top: 21.h, bottom: 22.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            "Refer & Earn",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GestureDetector(
              onTap: () {
                Get.to(()=>const ReferAndEarnHistory());
              },
              child: const Text(
                "History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]);
  }

  /// Section Widget
  Widget _buildUndrawSavingsReEqw() {
    return SizedBox(
        child: Stack( children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  width: double.infinity,
                    decoration: AppDecoration.fillPrimary,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100,bottom: 65),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        // 100.h.verticalSpace,
                        SvgPicture.asset(
                            ImageConstant
                                .imgUndrawSavingsReEq4wPrimarycontainer,
                            // height: 178.h,
                            // width: 222.w
                        ),
                        SizedBox(height: 36.h),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center, children: [
                          Padding(
                              padding: EdgeInsets.only(right: 7.w),
                              child: _buildRsCounter(
                                  rsCounter: "Rs 1000",
                                  lifetimeEarnings: "Current Amount")),
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.only(left: 7.w),
                                child: _buildRsCounter(
                                    rsCounter: "Rs 3000",
                                    lifetimeEarnings: "Lifetime Earnings")),
                          )
                        ])
                      ]),
                    )),
              )),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                  margin: EdgeInsets.only(top: 322.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 11.h),
                  decoration: AppDecoration.outlineBlack90020
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            color: const Color(0XFF00C1FF),
                            imagePath: ImageConstant.imgWallet1,
                            height: 50.h,
                            width: 50.w),
                        Expanded(
                            child: Container(
                                width: 266.w,
                                margin: EdgeInsets.only(
                                    left: 5.w, top: 10.h, bottom: 3.h),
                                child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Share your referral code and invite your friends and get  ",
                                          style: CustomTextStyles
                                              .bodySmallInterff000000),
                                      TextSpan(
                                          text: "Rs 100",
                                          style: CustomTextStyles
                                              .labelLargeInterff00c1ff),



                                      const TextSpan(text: " ")
                                    ]),
                                    textAlign: TextAlign.left)))
                      ])),
            ),
          )
        ]));
  }

  /// Section Widget
  Widget _buildShareApp() {
    return Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomElevatedButton(
              width: 165.w,
              text: "Share App",
              decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration),
          CustomElevatedButton(
              width: 165.h,
              text: "Redeem Now)",
              margin: EdgeInsets.only(left: 20.w),
              decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration)
        ]));
  }

  /// Common widget
  Widget _buildRsCounter({
    required String rsCounter,
    required String lifetimeEarnings,
  }) {
    return SizedBox(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 13.h),
            decoration: AppDecoration.fillPrimaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 2.h),
                  Text(rsCounter,
                      style: CustomTextStyles.titleMediumInter
                          .copyWith(color: appTheme.black900)),
                  SizedBox(height: 4.h),
                  Text(lifetimeEarnings,
                      style: CustomTextStyles.bodySmallInterBlack900_1
                          .copyWith(
                              color: appTheme.black900.withOpacity(0.6)))
                ])));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
