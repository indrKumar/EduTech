import 'package:edushalaacademy/View/Profile/contact_us.dart';
import 'package:edushalaacademy/View/Profile/edit_profile.dart';
import 'package:edushalaacademy/View/Profile/faq.dart';
import 'package:edushalaacademy/View/Profile/feedback.dart';
import 'package:edushalaacademy/View/Profile/guide.dart';
import 'package:edushalaacademy/View/Profile/leader_board.dart';
import 'package:edushalaacademy/View/Profile/letter.dart';
import 'package:edushalaacademy/View/Profile/notifications.dart';
import 'package:edushalaacademy/View/Profile/other_product.dart';
import 'package:edushalaacademy/View/Profile/refer_and_earn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../select_teacher_student.dart';
import '../widgets/app_bar/appbar_subtitle_eight.dart';
import '../widgets/app_bar/appbar_trailing_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_outlined_button.dart';
import '../widgets/custom_switch.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSelectedSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildLogoutTwentySix(),
            const SizedBox(height: 19),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      _buildDownloadLetter(),
                      SizedBox(height: 23.h),
                      Divider(
                        color: appTheme.black900,
                      ),
                      SizedBox(height: 18.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _buildEduShalaGuide1(),
                      ),
                      SizedBox(height: 20.h),
                      Divider(
                        color: appTheme.black900,
                      ),
                      SizedBox(height: 25.h),
                      _buildTeachingLocations(),
                      SizedBox(height: 10.h),
                      Container(
                        // width: 360.w,
                        margin: EdgeInsets.only(right: 9.w),
                        child: Text(
                          "(You’ll only receive leads within 5km of this address. You can add multiple such addresses to get more leads.)",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyMediumMontserrat13,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      _buildMap(),
                      SizedBox(height: 8.h),
                      _buildMap1(),
                      SizedBox(height: 12.h),
                      Divider(
                        color: appTheme.black900,
                      ),
                      SizedBox(height: 14.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payments Details",
                          style: CustomTextStyles.titleSmallBold,
                        ),
                      ),
                      SizedBox(height: 9.h),
                      _buildACNo(),
                      SizedBox(height: 17.h),
                      Divider(
                        color: appTheme.black900,
                      ),
                      SizedBox(height: 26.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Renumeration & Salary Options",
                          style: CustomTextStyles.titleSmallBold,
                        ),
                      ),
                      SizedBox(height: 19.h),
                      _buildBadge3rd1(),
                      SizedBox(height: 22.h),
                      _buildBugOne(),
                      SizedBox(height: 11.h),
                      _buildBlogOne(),
                      SizedBox(height: 11.h),
                      _buildNotificationTwo(),
                      SizedBox(height: 11.h),
                      _buildLeaderBoard(),
                      SizedBox(height: 11.h),
                      _buildOtherProduct(),
                      SizedBox(height: 11.h),
                      _buildFeedbackOne(),
                      SizedBox(height: 32.h),
                      SizedBox(
                        width: 129.w,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "© Copyright",
                                style: CustomTextStyles.bodySmallInterff000000,
                              ),
                              TextSpan(
                                text: "Edu Shala",
                                style: CustomTextStyles.bodySmallInterff00c1ff,
                              ),
                              TextSpan(
                                text: "App version 1.1.0",
                                style: CustomTextStyles.bodySmallInter2d000000,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLogoutTwentySix() {
    return SizedBox(
      height: 338,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            // height: 233.h,
            actions: [
              AppbarTrailingImage(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Get.offAll(SelectTeacherOrParent());
                },
                imagePath: ImageConstant.imgLogout26,
              ),
              AppbarSubtitleEight(
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Get.offAll(const SelectTeacherOrParent());
                },
                text: "Logout",
                margin: const EdgeInsets.symmetric(horizontal: 5),
              ),
              10.h.horizontalSpace,
            ],
            styleType: Style
                .bgGradientnamelightblueA400opacity053namelightblueA400opacity053,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.all(11.h),
              decoration: AppDecoration.outlineBlack90018.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    onTap: () {
                      Get.to(()=>const EditProfileScreen());
                    },
                    color: const Color(0XFF01A0E2),
                    imagePath: ImageConstant.imgEdit2,
                    height: 19.h,
                    width: 19.w,
                    alignment: Alignment.centerRight,
                  ),
                  const SizedBox(height: 60),
                  Text(
                    "Sagar Shukla (Tutor)",
                    style: CustomTextStyles.titleLarge20,
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                      right: 6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildThree(
                          dynamicText: "3",
                          dynamicText1: "Students",
                        ),
                        _buildThree(
                          dynamicText: "1567",
                          dynamicText1: "Classes",
                        ),
                        _buildThree(
                          dynamicText: "3",
                          dynamicText1: "Years",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 13.h),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUntitled51,
            height: 136.h,
            width: 135.w,
            radius: BorderRadius.circular(
              67.w,
            ),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 51.h),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDownloadLetter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: 6.h,
          ),
          child: GestureDetector(
            onTap: () {
              Get.to(()=>const LetterScreen());
            },
            child: Text(
              "Download Letter",
              style: CustomTextStyles.titleSmallInterPrimary,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgDownload,
          height: 13.h,
          width: 12.w,
          color: theme.primaryColor,
          margin: EdgeInsets.only(
            left: 7.w,
            top: 9.h,
            bottom: 8.h,
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(
            top: 5.h,
            bottom: 4.h,
          ),
          child: Text(
            "Active",
            style: CustomTextStyles.bodyLargeInterPrimary,
          ),
        ),
        CustomSwitch(
          margin: EdgeInsets.only(left: 18.h),
          value: isSelectedSwitch,
          onChange: (value) {
            setState(() {
              isSelectedSwitch = !isSelectedSwitch;
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSupportvalue() {
    return Expanded(
      child: CustomElevatedButton(
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: () {
          Get.to(()=>

              const ContactUsScreen());
        },
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 41.h,
        text: "Support",
        margin: EdgeInsets.only(right: 15.w),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgSupport11LightBlueA400,
            height: 24.h,
            width: 24.w,
          ),
        ),
        // buttonStyle: CustomButtonStyles.fillGray,
        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }

  /// Section Widget
  Widget _buildFAQ() {
    return Expanded(
      child: CustomElevatedButton(
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: () {
          Get.to(()=>const FaqScreen());
        },
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 41.h,
        text: "FAQ’s",
        margin: EdgeInsets.only(right: 15.w),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgFaq1,
            height: 24.h,
            width: 24.w,
          ),
        ),
        // buttonStyle: C

        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }

  /// Section Widget
  Widget _buildEduShalaGuide() {
    return Expanded(
      child: CustomElevatedButton(
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: () {
          Get.to(()=>const GuideScreen());
        },
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 41.h,
        text: "EduShala Guide",
        margin: EdgeInsets.only(right: 15.w),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgVideo1,
            height: 24.h,
            width: 24.w,
          ),
        ),
        // buttonStyle: CustomButtonStyles.fillGray,
        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }

  Widget _buildReferEarnvalue() {
    return Expanded(
      child: CustomElevatedButton(
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: () {
          Get.to(()=>const ReferAndEarnScreen());
        },
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 41.h,
        text: "Refer & Earn",
        margin: EdgeInsets.only(right: 15.w),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgShare21,
            height: 24.h,
            width: 24.w,
          ),
        ),
        // buttonStyle: CustomButtonStyles.fillGray,
        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }

  /// Section Widget
  Widget _buildEduShalaGuide1() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSupportvalue(),
                _buildEduShalaGuide(),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildFAQ(),
                _buildReferEarnvalue(),
              ],
            ),
          ),
        ],
      ),
    );
  }


  /// Section Widget
  Widget _buildTeachingLocations() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.h),
          child: Text(
            "Teaching Locations",
            style: CustomTextStyles.titleSmallBold,
          ),
        ),
        Text(
          "Add New Address",
          style: CustomTextStyles.titleSmallLightblueA400,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildMap() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 8.h,
      ),
      decoration: AppDecoration.fillLightblueA4001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          SizedBox(
            height: 143.h,
            // width: 342.w,
            // child: GoogleMap(
            //   //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
            //   mapType: MapType.normal,
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(
            //       37.43296265331129,
            //       -122.08832357078792,
            //     ),
            //     zoom: 14.4746,
            //   ),
            //   onMapCreated: (GoogleMapController controller) {
            //     googleMapController.complete(controller);
            //   },
            //   zoomControlsEnabled: false,
            //   zoomGesturesEnabled: false,
            //   myLocationButtonEnabled: false,
            //   myLocationEnabled: false,
            // ),
          ),
          SizedBox(height: 11.h),
          Container(
            // width: 300.w,
            margin: EdgeInsets.only(right: 41.w),
            child: Text(
              "HIG 717, Kailash nagar, near chetak bridge, Govindpura, Bhopal, Madhya Pradesh.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleSmallPrimaryContainer_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildMap1() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 8.h,
      ),
      decoration: AppDecoration.fillLightblueA4001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          SizedBox(
            height: 143.h,
            // width: 342.w,
            // child: GoogleMap(
            //   //TODO: Add your Google Maps API key in AndroidManifest.xml and pod file
            //   mapType: MapType.normal,
            //   initialCameraPosition: CameraPosition(
            //     target: LatLng(
            //       37.43296265331129,
            //       -122.08832357078792,
            //     ),
            //     zoom: 14.4746,
            //   ),
            //   onMapCreated: (GoogleMapController controller) {
            //     googleMapController1.complete(controller);
            //   },
            //   zoomControlsEnabled: false,
            //   zoomGesturesEnabled: false,
            //   myLocationButtonEnabled: false,
            //   myLocationEnabled: false,
            // ),
          ),
          SizedBox(height: 11.h),
          Container(
            // width: 300.w,
            margin: EdgeInsets.only(right: 41.w),
            child: Text(
              "HIG 717, Kailash nagar, near chetak bridge, Govindpura, Bhopal, Madhya Pradesh.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.titleSmallPrimaryContainer_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildACNo() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 6.h,
      ),
      decoration: AppDecoration.gradientGrayToGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 4.h,
              bottom: 1.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A/C No. :",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
                SizedBox(height: 3.h),
                Text(
                  "Name :",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
                SizedBox(height: 2.h),
                Text(
                  "IFSC :",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
                Text(
                  "Bank Name :",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
                SizedBox(height: 3.h),
                Text(
                  "Branch Address:",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
                SizedBox(height: 4.h),
                Text(
                  "UPI ID:",
                  style: CustomTextStyles.bodyMediumMontserratBlack900_1,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "xxxx xxx xxxx 3421",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 2.h),
                Text(
                  "Laxmi Chit Fund",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.h),
                Text(
                  "LXF230B23",
                  style: theme.textTheme.titleSmall,
                ),
                Text(
                  "Laxmi Chit Fund",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 3.h),
                Text(
                  "Laxmi Chit Fund",
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 5.h),
                Text(
                  "7223071800@ybl",
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBadge3rd() {
    return CustomOutlinedButton(
      height: 30.h,
      width: 119.w,
      text: "Badge 3rd ",
      margin: EdgeInsets.only(right: 31.w),
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientPrimaryToBlueTL15Decoration,
      buttonTextStyle: CustomTextStyles.titleSmallPrimaryContainerBold,
      alignment: Alignment.topRight,
    );
  }

  /// Section Widget
  Widget _buildBadge3rd1() {
    return SizedBox(
      height: 131.h,
      // width: 370.w,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 118.h,
              // width: 370.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.w,
                ),
                gradient: LinearGradient(
                  begin: const Alignment(0.03, 0.12),
                  end: const Alignment(0.97, 0.91),
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.onPrimaryContainer,
                  ],
                ),
              ),
            ),
          ),
          _buildBadge3rd(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBugOne() {
    return Container(
      padding: EdgeInsets.all(11.w),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgBug1,
            height: 18.h,
            width: 18.w,
            margin: EdgeInsets.only(left: 5.w),
          ),
          Padding(
            padding: EdgeInsets.only(left: 23.w),
            child: Text(
              "Report a Bug",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Spacer(),
          CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgArrowRightLightBlueA400,
            height: 12.h,
            width: 7.w,
            margin: EdgeInsets.only(
              top: 4.h,
              bottom: 3.h,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBlogOne() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 11.w,
        vertical: 9.h,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgBlog1,
            height: 22.h,
            width: 22.w,
            margin: EdgeInsets.only(
              left: 7.w,
              top: 1.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 17.w,
              top: 3.h,
              bottom: 2.h,
            ),
            child: Text(
              "Blogs",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const Spacer(),
          CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: ImageConstant.imgArrowRightLightBlueA400,
            height: 12.h,
            width: 7.w,
            margin: EdgeInsets.only(
              top: 6.h,
              bottom: 5.h,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildNotificationTwo() {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const OtherProductsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 10.h,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgNotification2LightBlueA400,
              height: 21.h,
              width: 21.w,
              margin: EdgeInsets.only(left: 8.w),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17.w,
                bottom: 2.h,
              ),
              child: Text(
                "Other Product",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgArrowRightLightBlueA400,
              height: 12.h,
              width: 7.w,
              margin: EdgeInsets.only(
                top: 5.h,
                bottom: 4.h,
              ),
            ),
          ],
        ),
      ),
    );
  } /// Section Widget
  Widget _buildLeaderBoard() {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const LeaderboardsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 10.h,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgNotification2LightBlueA400,
              height: 21.h,
              width: 21.w,
              margin: EdgeInsets.only(left: 8.w),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17.w,
                bottom: 2.h,
              ),
              child: Text(
                "Leader Board",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgArrowRightLightBlueA400,
              height: 12.h,
              width: 7.w,
              margin: EdgeInsets.only(
                top: 5.h,
                bottom: 4.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildOtherProduct() {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const NotificationsScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 10.h,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgNotification2LightBlueA400,
              height: 21.h,
              width: 21.w,
              margin: EdgeInsets.only(left: 8.w),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17.w,
                bottom: 2.h,
              ),
              child: Text(
                "Notifications",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgArrowRightLightBlueA400,
              height: 12.h,
              width: 7.w,
              margin: EdgeInsets.only(
                top: 5.h,
                bottom: 4.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFeedbackOne() {
    return GestureDetector(
      onTap: () {
        Get.to(()=>const FeedbackScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.w,
          vertical: 6.h,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgFeedback1,
              height: 27.h,
              width: 27.w,
              margin: EdgeInsets.only(
                left: 5.w,
                top: 2.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 14.w,
                top: 5.h,
                bottom: 6.h,
              ),
              child: Text(
                "Feedback",
                style: theme.textTheme.bodyMedium,
              ),
            ),
            const Spacer(),
            CustomImageView(
              color: const Color(0xFF00C2FF),
              imagePath: ImageConstant.imgArrowRightLightBlueA400,
              height: 12.h,
              width: 7.w,
              margin: EdgeInsets.only(
                top: 9.h,
                bottom: 8.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildThree({
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 16.h,
      ),
      decoration: AppDecoration.outlineBlack90019.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dynamicText,
            style: CustomTextStyles.titleLargeInterPrimaryContainer.copyWith(
              color: theme.colorScheme.primaryContainer.withOpacity(1),
            ),
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              dynamicText1,
              style: CustomTextStyles.bodyMediumPrimaryContainer.copyWith(
                color: theme.colorScheme.primaryContainer.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
