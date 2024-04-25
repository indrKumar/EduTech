import 'package:edushalaacademy/View/onBoarding/kyc_4/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../camera/RecordMain.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
class InstructionForVideoVar extends StatefulWidget {
  var id;
  var index;
   InstructionForVideoVar({super.key,this.index,this.id});

  @override
  State<InstructionForVideoVar> createState() => _InstructionForVideoVarState();
}

class _InstructionForVideoVarState extends State<InstructionForVideoVar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Arvind Pandey",
                    style: CustomTextStyles.titleMediumBold_1,
                  ),
                  Text(
                    "to offer you work at EduShala",
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(height: 42.w),
              Container(
                width: 286.h,
                margin: EdgeInsets.only(
                  left: 20.h,
                  right: 83.h,
                ),
                child: Text(
                  "Please record a short video and upload",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 20.w),
              _buildThirtyNine(),
              SizedBox(height: 25.w),
              Text(
                "Learn more about video verification",
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 10.w),
              _buildEdushalaOne(),
              SizedBox(height: 16.w),
              Text(
                "Note:\n1. Notebook and pen will be required \n1. Please show all the steps as you are solving the problems on the video",
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: 25.w),

            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildStartRecording(),
    );
  }

  /// Section Widget
  Widget _buildThirtyNine() {
    return Align(
      // alignment: Alignment.center,
      child: Container(
        width: 350.h,
        margin: EdgeInsets.only(
          left: 23.h,
          right: 17.h,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 14.w,
        ),
        decoration: AppDecoration.fillGray100.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.w),

              Text("There are 2 steps in this video",
              style: CustomTextStyles.bodyLargeff000000,
            ),
            18.h.verticalSpace,
            Container(
              margin: EdgeInsets.only(right: 7.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Step 1:",
                      style: CustomTextStyles.titleMediumff000000Bold,
                    ),
                    TextSpan(
                      text: "Meeting with our Coach/HR",
                      style: CustomTextStyles.bodyLargeff000000,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            5.h.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Step 2:",
                    style: CustomTextStyles.titleMediumff000000Bold,
                  ),
            TextSpan(
              text: "Remuneration offering",
              style: CustomTextStyles.bodyLargeff000000,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEdushalaOne() {
    return SizedBox(
      // height: 208.w,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWhatsappImage20240125,
            height: 208.w,
            // width: 390.h,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30.w,
              width: 51.h,
              margin: EdgeInsets.only(
                top: 12.w,
                right: 32.h,
              ),
              decoration: AppDecoration.fillGray30001,
              child: CustomImageView(
                imagePath: ImageConstant.imgEdushala1,
                height: 22.w,
                width: 37.h,
                alignment: Alignment.topRight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStartRecording() {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 25.w,
        ),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 7.w),
            CustomElevatedButton(
              onPressed: () {
                Get.to(()=>RecordMain(
                    index: widget.index,
                  id: widget.id,
                ));
              },
              text: "Start Recording",
              decoration:
              CustomButtonStyles.gradientPrimaryToBlueDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
