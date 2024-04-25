import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../payment_history.dart';
import '../../widgets/app_bar/appbar_subtitle_five.dart';
import '../../widgets/app_bar/appbar_subtitle_nine.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class PaymentStScreen extends StatefulWidget {
  const PaymentStScreen({super.key});

  @override
  State<PaymentStScreen> createState() => _PaymentStScreenState();
}

class _PaymentStScreenState extends State<PaymentStScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _buildAppBar(),
      body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.all(10.w),
          child: SingleChildScrollView(
            child: Column(children: [
              _buildSixtySix(),
              SizedBox(height: 18.h),
              ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _buildSeventySix(),
                      )),
              SizedBox(height: 15.h),
              _buildSixtyFive(),
              SizedBox(height: 19.h),
              CustomElevatedButton(
                text: "Pay Now",
                // buttonTextStyle:
                // CustomTextStyles.titleMediumPrimaryContainerMedium
              ),
              SizedBox(height: 5.h)
            ]),
          )),
    ));
  }

  Widget _buildSixtySix() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 28.h),
        decoration: AppDecoration.outlinePrimary3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder13),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "Rs ",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 30,
                            fontWeight: FontWeight.w700)
                        // CustomTextStyles.headlineLargeMontserratffffffff
                        ),
                    TextSpan(
                        text: "11700",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 45,
                            fontWeight: FontWeight.w700))
                  ]),
                  textAlign: TextAlign.left),
              SizedBox(height: 15.h),
              const Text("Amount Paid This Month",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white))
            ]));
  }

  Widget _buildSeventySix() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: AppDecoration.fillPrimary1
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tutor 1",
                  style: CustomTextStyles.labelLargeBlack900SemiBold),
              SizedBox(height: 11.h),
              Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        detCard("18/20", "Hours Consumed"),
                        detCard("18/20", "Sessions Consumed"),
                      ])),
              SizedBox(height: 15.h),
              RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Your redeem request is ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Montserrat",
                            fontSize: 12)),
                    TextSpan(
                        text: "Approved",
                        style: CustomTextStyles.labelLargeff00c838)
                  ]),
                  textAlign: TextAlign.left)
            ]));
  }

  Widget detCard(title, subtitle) {
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(right: 18.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 11.h),
            decoration: AppDecoration.outlineBlack900115
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title.toString(),
                      style: CustomTextStyles.titleLargeLightblueA400),
                  SizedBox(height: 2.h),
                  Text(subtitle.toString(), style: CustomTextStyles.bodySmall8),
                  SizedBox(height: 14.h),
                  SizedBox(
                      height: 4.h,
                      width: 128.w,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(2.w),
                          child: LinearProgressIndicator(
                              value: 0.77,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary))))
                ])));
  }

  Widget _buildSixtyFive() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 19.h),
        decoration: AppDecoration.outlinePrimary4
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 4.h),
              Text("4 Days remaining to get dues",
                  style: CustomTextStyles.titleMediumSemiBold16),
              SizedBox(height: 22.h),
              Padding(
                  padding: EdgeInsets.only(left: 13.w),
                  child: Container(
                      height: 10.h,
                      width: 319.w,
                      decoration: BoxDecoration(
                          // color: appTheme.blueGray10070,
                          borderRadius: BorderRadius.circular(5.w)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.w),
                          child: LinearProgressIndicator(
                              value: 0.77,
                              // backgroundColor: appTheme.blueGray10070,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary)))))
            ]));
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.h,
        title: AppbarSubtitleNine(
            text: "Payments Details", margin: const EdgeInsets.only(left: 22)),
        actions: [
          AppbarSubtitleFive(
              onTap: () {
                Get.to(() => const PaymentsHistory(),
                    transition: Transition.size,
                    duration: const Duration(milliseconds: 500));
              },
              text: "Payment History",
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18))
        ]);
  }

  onTapArrowLeft() {
    Get.back();
  }
}
