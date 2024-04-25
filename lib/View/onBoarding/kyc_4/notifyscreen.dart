import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../theme/custom_text_style.dart';
import '../../../utils/image_constant.dart';

class Notify_Screen extends StatefulWidget {
  const Notify_Screen({super.key});

  @override
  State<Notify_Screen> createState() => _Notify_ScreenState();
}

class _Notify_ScreenState extends State<Notify_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        ),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 53.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(ImageConstant.imgUndrawResearchingReFuod,
                  height: 163.w, width: 260.h),
              SizedBox(height: 37.w),
              SizedBox(
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                "Our team will coordinate with you for the virtual interview. Please ",
                            style: CustomTextStyles.titleMediumff000000Bold_1),
                        TextSpan(
                            text: "check in few days.",
                            style: CustomTextStyles.titleMediumff00c1ffBold_1)
                      ]),
                      textAlign: TextAlign.center)),
              SizedBox(height: 5.w)
            ])));
  }

  onTapArrowLeft() {
    Get.back();
  }
}
