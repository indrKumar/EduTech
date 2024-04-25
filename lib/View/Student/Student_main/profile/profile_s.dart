import 'package:edushalaacademy/View/Profile/contact_us.dart';
import 'package:edushalaacademy/View/Profile/edit_profile.dart';
import 'package:edushalaacademy/View/Profile/faq.dart';
import 'package:edushalaacademy/View/Profile/feedback.dart';
import 'package:edushalaacademy/View/Profile/guide.dart';
import 'package:edushalaacademy/View/Profile/leader_board.dart';
import 'package:edushalaacademy/View/Profile/notifications.dart';
import 'package:edushalaacademy/View/Profile/other_product.dart';
import 'package:edushalaacademy/View/Profile/refer_and_earn.dart';
import 'package:edushalaacademy/View/Student/Student_main/profile/blog_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../theme/app_decoration.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../utils/image_constant.dart';
import '../../../widgets/app_bar/appbar_subtitle_eight.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_image_view.dart';

class ProfilePageS extends StatefulWidget {
  const ProfilePageS({super.key});

  @override
  State<ProfilePageS> createState() => _ProfilePageSState();
}

class _ProfilePageSState extends State<ProfilePageS> {
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
            SizedBox(height: 19.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      SizedBox(height: 18.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: _buildEduShalaGuide1(),
                      ),
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

  Widget _buildLogoutTwentySix() {
    return SizedBox(
      height: 338.h,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            // height: 233.h,
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgLogout26,
              ),
              AppbarSubtitleEight(
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
                  SizedBox(height: 50.h),
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
          Positioned(
            top: 25.h,

            child: CircleAvatar(

              radius: 50,
              child: Image(image: AssetImage(ImageConstant.imgUntitled51)),
            ),
          ),
        ],
      ),
    );
  }




  Widget _buildEduShalaGuide(title,icon,void Function() onTap) {
    return Expanded(
      child: CustomElevatedButton(
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: onTap,
        decoration: const BoxDecoration(color: Colors.transparent),
        height: 41.h,
        text: title,
        margin: EdgeInsets.only(right: 15.w),
        leftIcon: Container(
          margin: EdgeInsets.only(right: 16.w),
          child: CustomImageView(
            color: const Color(0xFF00C2FF),
            imagePath: icon,
            height: 24.h,
            width: 24.w,
          ),
        ),
        // buttonStyle: CustomButtonStyles.fillGray,
        buttonTextStyle: theme.textTheme.bodyMedium!,
      ),
    );
  }


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
                _buildEduShalaGuide("Support",ImageConstant.imgSupport11LightBlueA400,() {
                  Get.to(()=>const ContactUsScreen());
                }),
                _buildEduShalaGuide("EduShala Guide",ImageConstant.imgVideo1,() {
                  Get.to(()=>const GuideScreen());
                }),
              ],
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildEduShalaGuide("FAQ’s",ImageConstant.imgFaq1,() {
                  Get.to(()=>const FaqScreen());
                }),
                _buildEduShalaGuide("Refer & Earn",ImageConstant.imgShare21,() {
                  Get.to(()=>const ReferAndEarnScreen());
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
    return GestureDetector(
      onTap: () {
        Get.to(()=>const BlogPage());
      },
      child: Container(
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
            Spacer(),
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
