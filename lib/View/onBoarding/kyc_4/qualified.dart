import 'package:edushalaacademy/View/onBoarding/kyc_4/notifyscreen.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/result_screen.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/unqualified.dart';
import 'package:edushalaacademy/controllers/virtual/virtual_status_controller.dart';
import 'package:edushalaacademy/models/interview_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class QualifiedScreen extends StatefulWidget {
  const QualifiedScreen({super.key});

  @override
  State<QualifiedScreen> createState() => _QualifiedScreenState();
}

class _QualifiedScreenState extends State<QualifiedScreen> {
  final VirtualInterviewStatusController virtualInterviewController =
      Get.put(VirtualInterviewStatusController());
  final InterviewStatus interviewStatus = InterviewStatus();

  @override
  void initState() {
    virtualInterviewController.fetchInterviewStatusData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    virtualInterviewController.fetchInterviewStatusData();
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Obx(
        () {
          if (virtualInterviewController.interviewResponse.value.isError!) {
            return const Notify_Screen();
          } else if (virtualInterviewController
                  .interviewResponse.value.status ==
              true) {
            if (virtualInterviewController.interviewResponse.value.subjects !=
                null) {
              return Scaffold(
                body: Container(
                  padding: EdgeInsets.only(top: 56.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, -0.01),
                      end: Alignment(1.03, 1.02),
                      colors: [theme.colorScheme.primary, appTheme.blue90001],
                    ),
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 41.w),
                    child: Column(
                      children: [
                        Text(
                          "Congratulations!",
                          textAlign: TextAlign.center,
                          style:
                              CustomTextStyles.displayMediumPrimaryContainer50,
                        ),
                        SizedBox(height: 6.w),
                        Container(
                          margin: EdgeInsets.only(left: 33.h, right: 34.h),
                          child: Text(
                            "You have been qualified for the following categories",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodyLargePrimaryContainer18,
                          ),
                        ),
                        30.h.verticalSpace,
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  top: 70,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 27.w),
                                    decoration:
                                        AppDecoration.outlineBlack9004.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder7,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 39.w),
                                          Text(
                                            virtualInterviewController
                                                    .interviewResponse
                                                    .value
                                                    .name ??
                                                '',
                                            style: CustomTextStyles
                                                .titleMediumSemiBold,
                                          ),
                                          Text(
                                            "Tutor",
                                            style: CustomTextStyles
                                                .titleSmallBlack900,
                                          ),
                                          Column(
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                itemCount:
                                                    virtualInterviewController
                                                        .interviewResponse
                                                        .value
                                                        .subjects!
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  var data =
                                                      virtualInterviewController
                                                          .interviewResponse
                                                          .value
                                                          .subjects![0][index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 8),
                                                    child: list(context,
                                                        data!["name"], index,
                                                        subjects: virtualInterviewController
                                                            .interviewResponse
                                                            .value
                                                            .subjects?[index]),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: 121.w,
                                    width: 121.h,
                                    decoration:
                                        AppDecoration.outlineBlue.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder60,
                                    ),
                                    child: CustomImageView(
                                      imagePath:  virtualInterviewController
                                          .interviewResponse
                                          .value
                                          .profilePic != null && virtualInterviewController
                                          .interviewResponse
                                          .value
                                          .profilePic!.isNotEmpty ? virtualInterviewController
                                          .interviewResponse
                                          .value
                                          .profilePic : ImageConstant
                                          .imgWaistUpPortrait121x121,
                                      height: 121.w,
                                      width: 121.h,
                                      radius: BorderRadius.circular(60.h),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 33.w),
                        SizedBox(height: 5.w),
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: bottomButton(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          } else {
            return const UnqualifiedScreen(); // Placeholder return
          }
        },
      ),
    );
  }

  Widget bottomButton() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 24.w),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomElevatedButton(
              onPressed: () {
                Get.to(() => const ResultScreen());
              },
              text: "Continue",
              margin: EdgeInsets.only(left: 14.h, right: 19.h),
              buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3),
          SizedBox(height: 7.w)
        ]));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            onTapArrowLeft();
          },
          child: const Icon(Icons.arrow_back_ios_new)),
    );
  }

  Widget list(BuildContext context, name, index,
      {List<dynamic>? subjects}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 3.w,
      ),
      decoration: AppDecoration.fillPrimary1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name.toString(),
            style: CustomTextStyles.titleMediumSemiBold,
          ),
          SizedBox(height: 6.w),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text(
                    subjects?[index]!["name"].toString() ?? '',
                    style: CustomTextStyles.labelLargeSemiBold,
                  );
                },
                separatorBuilder: (context, index) {
                  return Text(" | ",style: CustomTextStyles.labelLargeSemiBold,);
                },
                itemCount: 3),
          ),
          // SizedBox(height: 5.w),
          // Text(
          //   "Hindi, English, Sanskrit",
          //   style: CustomTextStyles.labelLargeBlack900,
          // ),
          // SizedBox(height: 7.w),
        ],
      ),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
