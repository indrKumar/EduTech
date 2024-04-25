import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_seven.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_image_view.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 1.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Text("Today",
                            style: CustomTextStyles.labelLargeBlack900_4)),
                    SizedBox(height: 12.h),
                    _buildUserProfile()
                  ]),
            )));
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.w,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.w, top: 22.h, bottom: 21.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleSeven(
            text: "Notifications", margin: EdgeInsets.only(left: 22.w)));
  }

  Widget _buildUserProfile() {
    return Padding(
        padding: EdgeInsets.only(left: 1.w),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.5.h),
                  child: SizedBox(
                      width: 350.w,
                      child: Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: appTheme.black900.withOpacity(0.1))));
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgGraphicDesign44x45,
                    height: 44.h,
                    width: 45.w,
                    radius: BorderRadius.circular(
                      5.w,
                    ),
                    margin: EdgeInsets.only(top: 3.h),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 248.w,
                            child:  Text(
                                "There are many variations of Lore ipsum available",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelLargeBlack900_4,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                             "10 min ago",
                              style: CustomTextStyles.bodySmall10,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
  }

  onTapArrowLeft() {
    Get.back();
  }
}
