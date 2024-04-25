import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_nine.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_image_view.dart';

class NoticesDetailsScreen extends StatefulWidget {
  const NoticesDetailsScreen({super.key});

  @override
  State<NoticesDetailsScreen> createState() => _NoticesDetailsScreenState();
}

class _NoticesDetailsScreenState extends State<NoticesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 15.w),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 337.h,
                        margin: EdgeInsets.only(left: 4.h, right: 8.h),
                        child: Text("There are many variations of Lore ipsum available",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleMediumBold)),
                    SizedBox(height: 15.w),
                    Text("10 min ago",
                        style: CustomTextStyles.bodySmallBlack90010),
                    SizedBox(height: 8.w),
                    SizedBox(
                        width: 350.h,
                        child: Text("Dear Educators,\n\nAs you are already aware, we have approached in the final stretch of this academic year and We firmly acknowledge your dedication towards student, continuity over classes and the hard work you have put over the year. This is very crucial time for student to ensure him uninterrupted support and guidance.\n\nIn light of this, we would like to remind all tutors that no leave requests will be approved until the conclusion of the examination period.\n\nDuring this critical time, our commitment to our students is of utmost priority. Any absence without prior approval will result in a deduction of 20% from your monthly salary.\n\nWe appreciate your understanding and cooperation in maintaining the academic continuity for our students.\n\n If you face any unavoidable circumstances, please reach out to the management well in advance to discuss possible solutions.\nThank you for your dedication to our institution and the success of our students.\n\nBest Regards,\n\nAnkit LanjewarStudy\n SupervisorEdushala",
                            maxLines: 33,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.titleSmallBlack900_4
                                .copyWith(height: 1.20))),
                    SizedBox(height: 22.w),
                    CustomImageView(
                      color: Colors.black,
                        imagePath: ImageConstant.imgAttachment1,
                        height: 24.w,
                        width: 24.h),
                    SizedBox(height: 9.w),
                    _buildNoticesdetails()
                  ]),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.h, top: 22.w, bottom: 21.w),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleNine(
            text: "Notice", margin: EdgeInsets.only(left: 22.h)));
  }

  /// Section Widget

  Widget _buildNoticesdetails() {
    return SizedBox(
        height: 44.w,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 3.h, right: 122.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 15.h);
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 45.h,
                child: CustomImageView(
                  imagePath: ImageConstant.imgGraphicDesign44x45,
                  height: 44.w,
                  width: 45.h,
                  radius: BorderRadius.circular(
                    5.h,
                  ),
                ),
              );
            }));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
