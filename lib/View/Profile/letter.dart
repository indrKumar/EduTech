import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen({super.key});

  @override
  State<LetterScreen> createState() => _LetterScreenState();
}

class _LetterScreenState extends State<LetterScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Column(children: [
          SizedBox(height: 56.h),
          Column(
              children: [
            CustomImageView(
                imagePath: ImageConstant.imgArrowLeftPrimarycontainer,
                height: 12.h,
                width: 7.w,
                color: Colors.white,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 21.w),
                onTap: () {
                  onTapImgArrowLeft();
                }),
            SizedBox(height: 2.h),
            Text("Letters you Earned",
                style: CustomTextStyles.titleLargePrimaryContainer),
            SizedBox(height: 26.h),

          ]),
          Expanded(
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                    horizontal: 23.w, vertical: 81.h),
                decoration:BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withOpacity(1) ,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(25),topLeft:  Radius.circular(25))
                ),
                child:
                Column(
                    children: [
                      SvgPicture.asset(
                          ImageConstant.imgUndrawTeachingReG7e3,
                          height: 194.h,
                          width: 263.w),
                      SizedBox(height: 40.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sorry!",
                              style: CustomTextStyles
                                  .titleMediumBlack900Bold)),
                      SizedBox(height: 3.h),
                      Container(
                        // width: 336.w,
                          margin: EdgeInsets.only(right: 5.w),
                          child: Text("You have not earned any letters yet. You’ll get the same after fulfilling certain criteria. Check back in few months.\n\nThanks!",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles
                                  .titleMediumBlack90016_1)),
                      SizedBox(height: 3.h)
                    ])),
          )
        ]));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
