import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class ReferAndEarnHistory extends StatefulWidget {
  const ReferAndEarnHistory({super.key});

  @override
  State<ReferAndEarnHistory> createState() => _ReferAndEarnHistoryState();
}

class _ReferAndEarnHistoryState extends State<ReferAndEarnHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leadingWidth:12.h ,
            leading: Padding(
              padding: const EdgeInsets.only(left: 11),
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back_ios)),
            ),
            title: Text(
              "History",
              style: theme.textTheme.titleSmall!.copyWith(
                color: appTheme.black900,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11,vertical: 20),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildUserProfile(),
              Text("Terms & Conditions",
                  style: CustomTextStyles.labelLargeInterLightblueA400
                      .copyWith(decoration: TextDecoration.underline)),
              SizedBox(height: 13.h),
              Container(
                  width: 315.w,
                  margin: EdgeInsets.only(left: 4.w, right: 30.w),
                  child: Text(
                      "Referred person must be unique and not verified as a tutor with Edushala.Ensure the referred individual completes the full onboarding process for validation.",
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodySmallInterGray400
                          .copyWith(height: 1.48))),
              SizedBox(height: 5.h)
            ]),
          ),
        ),
        bottomNavigationBar: _buildRedeemNowRs1000());
  }

  Widget _buildUserProfile() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(10.w),
          child: Container(
            decoration: AppDecoration.fillLightBlueA.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 4.h, bottom: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your referral code used by",
                        style: CustomTextStyles.bodySmallOnError,
                      ),
                      Text(
                        "Sangram Singh",
                        style: CustomTextStyles.labelLargeBlack900_4,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "+ Rs 200",
                          style: CustomTextStyles.labelLargeGreenA700_1,
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Text(
                        "Jan 11, 2024  02:23 PM",
                        style: CustomTextStyles.bodySmall8_2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRedeemNowRs1000() {
    return CustomElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Ensures the bottom sheet is scrollable
          builder: (context) {
            return Column(mainAxisSize: MainAxisSize.min,
              children: [
                submittedSheet(context)
              ],
            );
          },
        );
      },
      text: "Redeem Now (Rs 1000)",
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30.h),
      decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
    );
  }

  Widget submittedSheet(BuildContext context){
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 45.h,
      ),
      decoration: AppDecoration.fillPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Text(
                "Redeem Request Submitted!",
                style: CustomTextStyles.titleMediumBlack900Bold,
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 325.h,
              margin: EdgeInsets.only(
                left: 4.w,
                right: 20.w,
              ),
              child: Text(
                "Your redeem request is submitted successfully & your request ID is #556473. It will be processed within 3 working days.".tr,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.titleMediumBlack90016_1,
              ),
            ),
          ),
          SizedBox(height: 41.h),
          CustomElevatedButton(
            text: "Okay!".tr,
          ),
        ],
      ),
    );
  }

  Widget redeemNow(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) =>  Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 45.h,
        ),
        decoration: AppDecoration.fillPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL25,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: Text(
                    "lbl_redeem_now2",
                    style: CustomTextStyles.titleMediumBlack900Bold,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 325.w,
                  margin: EdgeInsets.only(
                    left: 4.w,
                    right: 20.w,
                  ),
                  child: Text(
                    "msg_it_may_take_up_to",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleMediumBlack90016_1,
                  ),
                ),
              ),
              SizedBox(height: 21.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.w,
                  right: 5.w,
                ),
                child: CustomTextFormField(
                  // controller: controller.yourUpiIdController,
                  hintText: "lbl_your_upi_id".tr,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(height: 41.h),
              CustomElevatedButton(
                onPressed: () {
                  submittedSheet(context);
                },
                text: "lbl_request_redeem",
              ),
              SizedBox(height: 23.h),
              Text(
                "lbl_cancel",
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
