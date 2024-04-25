import 'package:edushalaacademy/View/onBoarding/kyc_step_1/kyc_spep_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/custom_button_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class FirstOverView_Screen extends StatefulWidget {
  const FirstOverView_Screen({super.key});

  @override
  State<FirstOverView_Screen> createState() => _FirstOverView_ScreenState();
}

class _FirstOverView_ScreenState extends State<FirstOverView_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 113.h),
                CustomImageView(
                  imagePath: ImageConstant.overView1stForOn,
                ),
                SizedBox(height: 140.h),
              ],
            ),
          ),
        ),
        floatingActionButton: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: CustomElevatedButton(
            onPressed: () {
              Get.offAll(const Kyc_Step_One_Screen());
            },
            // width: 350.h,
            text: "Start",
            margin: EdgeInsets.only(bottom: 33.h),
            // buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            alignment: Alignment.bottomCenter,
          ),
        )));
  }
}
