import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';

class LeadsAll extends StatefulWidget {
  const LeadsAll({super.key});

  @override
  State<LeadsAll> createState() => _LeadsAllState();
}

class _LeadsAllState extends State<LeadsAll> {
  // bool _isExpanded = false;
  final List<bool> _isExpandedList = List.filled(5, false);

  void _toggleExpanded(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: theme.colorScheme.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 5),
              child: _buildThthCBSE2(
                  onTap: () {
                    _toggleExpanded(index);
                  },
                  index: index),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThthCBSE2({onTap, index}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 10.h),
      decoration: AppDecoration.outlineBlack90016.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Your existing content
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
          Column(
            children: [
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
            ],
          ),
          if (_isExpandedList[index])
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Class Remark",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00C2FF),
                      fontFamily: "Montserrat"),
                ),
                5.h.verticalSpace,
                const Text(
                  "1. Tutor unavailable in specified location.\n2. They requirement is fulfilled by other service provider, they don’t require the services now.Strictly female tutor requirement.English communication requirement",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5D5D5D),
                      fontFamily: "Montserrat"),
                )
              ],
            ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onTap,
              child: Card(
                color: Colors.transparent,
                elevation: 0,
                margin: EdgeInsets.zero,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Know more",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    _isExpandedList[index]
                        ? Icon(Icons.keyboard_arrow_up_outlined,
                            color: Colors.grey.shade700)
                        : Icon(Icons.keyboard_arrow_down_sharp,
                            color: Colors.grey.shade700),
                  ],
                ),
              ),
            ),
          ),
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
