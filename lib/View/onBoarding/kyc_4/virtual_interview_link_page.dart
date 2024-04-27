import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/models/vertual_details_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/virtual/virtualcontroller.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/clipboard.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import 'notifyscreen.dart';

class VirtualInterviewScreen extends StatefulWidget {
  const VirtualInterviewScreen({super.key});

  @override
  State<VirtualInterviewScreen> createState() => _VirtualInterviewScreenState();
}

class _VirtualInterviewScreenState extends State<VirtualInterviewScreen> {
  final VirtualInterviewController _controller =
      Get.put(VirtualInterviewController());

  @override
  void initState() {
    super.initState();
    _fetchInterviewData();
  }

  bool isChecking = true;

  Future<void> _fetchInterviewData() async {
    try {
      await _controller.fetchInterviewData();
      setState(() {
        isChecking = false;
      });
    } catch (e) {
      print('Error fetching interview data: $e');
      setState(() {
        isChecking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isChecking
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyCircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  const Text("Please wait while we check for updates")
                ],
              ),
            ),
          )
        : _controller.isSchedule.value
            ? const Notify_Screen()
            : Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: theme.colorScheme.primary,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: theme.primaryColor,
                  leading: GestureDetector(
                      onTap: () {
                        onTapArrowLeft();
                      },
                      child: const Icon(Icons.arrow_back_ios_new)),
                ),
                body: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 44.w),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        SvgPicture.asset(ImageConstant.imgUndrawLearning,
                            height: 210.w, width: 263.h),
                        SizedBox(height: 37.w),
                        SizedBox(
                            width: 228.h,
                            child: Text("Your Virtual Interview is Scheduled",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: CustomTextStyles
                                    .titleMediumPrimaryContainerBold)),
                        SizedBox(height: 40.w),
                        _buildMeetingLinkvalue(
                            _controller.interviewResponse.value),
                        SizedBox(height: 50.w)
                      ]),
                    )));
  }

  Future<void> launchMeetingLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  /// Section Widget
  Widget _buildMeetingLinkvalue(InterviewResponse interviewResponse) {
    return Obx(
      () => Container(
          decoration: AppDecoration.outlineBlack9004
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
          child: _controller.isSchedule.value
              ? Center(
                  child: MyCircularProgressIndicator(),
                )
              : Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 11.w),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 12.h, right: 53.h),
                          child: Row(children: [
                            CircleAvatar(
                              radius: 30,
                              child: interviewResponse.profilePic
                                      .toString()
                                      .isNotEmpty
                                  ? Image.network(
                                      fit: BoxFit.cover,
                                      interviewResponse.profilePic.toString())
                                  : SvgPicture.asset(
                                      ImageConstant.imgWaistUpPortrait),
                              // backgroundColor: Colors.red,
                              // // foregroundColor: Colors.red,
                            ),
                            Expanded(
                                child: Padding(
                                    padding: EdgeInsets.only(left: 22.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              interviewResponse.interviewer
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleMediumSemiBold),
                                          SizedBox(height: 4.w),
                                          Text(
                                              interviewResponse.designation
                                                  .toString(),
                                              style: CustomTextStyles
                                                  .titleSmallBlack900),
                                          SizedBox(height: 6.w),
                                          Text(
                                              "${interviewResponse.interviewDate ?? "Jan 26, 2024"} | ${interviewResponse.startTime} - ${interviewResponse.endTime} ",
                                              style: CustomTextStyles
                                                  .labelLargeBlack900)
                                        ])))
                          ]))),
                  SizedBox(height: 27.w),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Meeting Link",
                                style: CustomTextStyles.bodySmallGray500),
                            Expanded(
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 5.w, bottom: 8.w),
                                    child: Divider(
                                        color:
                                            appTheme.black900.withOpacity(0.2),
                                        indent: 10.h)))
                          ])),
                  SizedBox(height: 6.w),
                  Padding(
                      padding: EdgeInsets.only(left: 16.h, right: 15.h),
                      child: CustomTextFormField(
                          readOnly: true,
                          hintText: interviewResponse.interviewLink ?? '',
                          textInputAction: TextInputAction.done,
                          suffix: Container(
                              margin:
                                  EdgeInsets.fromLTRB(30.h, 10.w, 10.h, 11.w),
                              child: CustomImageView(
                                  onTap: () {
                                    copyTextToClipboard(interviewResponse
                                        .interviewLink
                                        .toString());
                                  },
                                  imagePath: ImageConstant.imgLinkpage1,
                                  height: 24.w,
                                  color: const Color(0XFF01A0E2),
                                  width: 24.h)),
                          suffixConstraints: BoxConstraints(maxHeight: 45.w),
                          contentPadding: EdgeInsets.only(
                              left: 17.h, top: 15.w, bottom: 15.w))),
                  SizedBox(height: 24.w),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 14.h, vertical: 16.w),
                      decoration: AppDecoration.fillGray5001.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderBL7),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 3.w),
                            CustomElevatedButton(
                                onPressed: () {
                                  _launchUrl(Uri.parse(interviewResponse
                                      .interviewLink
                                      .toString())).then((value){
                                      Get.to(() => const Kyc_Step_Four_Vidio());
                                  });
                                },

                                // launchMeetingLink(interviewResponse
                                //     .interviewLink
                                //     .toString()).then((value) {
                                //
                                // });
                                // Get.to(() => const QualifiedScreen());
                                // },
                                text: "Join Now",
                                buttonTextStyle: CustomTextStyles
                                    .titleMediumPrimaryContainer_3)
                          ]))
                ])),
    );
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
