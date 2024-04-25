import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';

class LeadsScreen extends StatefulWidget {
  const LeadsScreen({super.key});

  @override
  State<LeadsScreen> createState() => _LeadsScreenState();
}

class _LeadsScreenState extends State<LeadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 5),
            child: _buildThthCBSE4(),
          );
        },
      )),
        );
  }

  onTapArrowLeft() {
    Get.back();
  }

  Widget _buildThthCBSE4() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.w,
        vertical: 10.h,
      ),
      decoration: AppDecoration.outlineBlack90016.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 2.w),
            child: _buildThthCBSE(
              dynamicText: "9th & 10th CBSE",
              text: "|",
            ),
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "01 Male, 02 Female",
              style: CustomTextStyles.labelLargeBlack900SemiBold_3,
            ),
          ),
          SizedBox(height: 11.h),
          Padding(
            padding: EdgeInsets.only(right: 1.w),
            child: _buildHindiMathsScience(
              viewName: "Hindi, Maths, Science",
              duration: "2 days ago",
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Indrapuri, Bhopal",
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 17.h),
          SizedBox(
            height: 15.h,
            width: 348.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const DottedLine(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  lineLength: double.infinity,
                  lineThickness: 2.0,
                  dashLength: 10.0,
                  dashColor: Colors.black38,
                  dashRadius: 2.0,
                  dashGapLength: 5.0,
                  dashGapColor: Colors.transparent,
                  dashGapRadius: 2.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 39.w,
                      right: 42.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: appTheme.blueGray10001,
                            borderRadius: BorderRadius.circular(
                              7.w,
                            ),
                          ),
                        ),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: appTheme.orange700,
                            borderRadius: BorderRadius.circular(
                              7.w,
                            ),
                          ),
                        ),
                        Container(
                          height: 15.h,
                          width: 15.w,
                          decoration: BoxDecoration(
                            color: appTheme.greenA700,
                            borderRadius: BorderRadius.circular(
                              7.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 9.h),
          Padding(
            padding: EdgeInsets.only(
              left: 14.w,
              right: 19.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 69.w,
                  margin: EdgeInsets.only(bottom: 12.h),
                  child: Text(
                    "Jan 11, 2024",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.labelLargeBlack900Bold_1.copyWith(
                      height: 1.25,
                    ),
                  ),
                ),
                const Spacer(
                  flex: 48,
                ),
                SizedBox(
                  width: 77.w,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Jan 11, 2024",
                          style: CustomTextStyles.bodySmallff000000,
                        ),
                        TextSpan(
                          text: " Received By Admin",
                          style: CustomTextStyles.labelLargeff000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(
                  flex: 51,
                ),
                Container(
                  width: 69.w,
                  margin: EdgeInsets.only(bottom: 13.h),
                  child: Text(
                    "Jan 11, 2024 Selected",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.labelLargeBlack900Bold_1.copyWith(
                      height: 1.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 26.h),
          Text(
            "View Demo Details".tr,
            style: CustomTextStyles.titleSmallLightgreenA700,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildThthCBSE({
    required String dynamicText,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 3.h,
            bottom: 2.h,
          ),
          child: Text(
            dynamicText,
            style: CustomTextStyles.titleMediumSemiBold16.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 19.w,
            top: 7.h,
            bottom: 3.h,
          ),
          child: Text(
            text,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgHome52,
          height: 18.h,
          width: 18.w,
          color: Colors.black,
          margin: EdgeInsets.only(
            left: 11.w,
            top: 4.h,
            bottom: 3.h,
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgBike1,
          height: 18.h,
          color: Colors.black,
          width: 18.w,
          margin: EdgeInsets.only(
            left: 10.w,
            top: 4.h,
            bottom: 3.h,
          ),
        ),
        const Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgSave,
          height: 26.h,
          color: const Color(0xFF00C2FF),
          width: 26.w,
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildHindiMathsScience({
    required String viewName,
    required String duration,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Text(
            viewName,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Text(
          duration,
          style: CustomTextStyles.bodySmallPoppinsBlack900_1.copyWith(
            color: appTheme.black900.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
