import 'package:edushalaacademy/View/payment_history.dart';
import 'package:edushalaacademy/View/widgets/app_bar/appbar_leading_image.dart';
import 'package:edushalaacademy/View/widgets/app_bar/appbar_subtitle_five.dart';
import 'package:edushalaacademy/View/widgets/app_bar/appbar_subtitle_nine.dart';
import 'package:edushalaacademy/View/widgets/app_bar/custom_app_bar.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

import '../theme/app_decoration.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';
import '../utils/image_constant.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              child: Column(children: [

                _buildZipcode2(),
                SizedBox(height: 22),
                _buildAnkitShuklaTwo(),
                SizedBox(height: 13),
                _buildRequestRedeem(),
                SizedBox(height: 5)
              ]),
            )));
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 11, top: 11, bottom: 23),
            onTap: () {
              onTapArrowLeft();
            }),
        title: AppbarSubtitleNine(
            text: "Payments Details",
            margin: EdgeInsets.only(left: 22)),
        actions: [
          AppbarSubtitleFive(
            onTap: (){

              Get.to(()=>PaymentsHistory(),
              transition: Transition.size,
              duration: Duration(milliseconds: 500));
            },
              text: "Payment History",
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 18))
        ]);
  }

  /// Section Widget
  Widget _buildZipcode2() {
    return SizedBox(
        // height: 334,
        // width: 350,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: AppDecoration.outlinePrimary3.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder13),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(height: 14),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 42),
                            child: Row(children: [
                              Text("Student",
                                  style: CustomTextStyles
                                      .labelLargePrimaryContainerSemiBold_1),
                              const Spacer(flex: 59),
                              Text("Pay",
                                  style: CustomTextStyles
                                      .labelLargePrimaryContainerSemiBold_1),
                              const Spacer(flex: 40),
                              Text("Graph Title",
                                  style: CustomTextStyles
                                      .labelLargePrimaryContainerSemiBold_1)
                            ]))),
                    const SizedBox(height: 19),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: _buildShivamBhargav(
                            shivamBhargav: "Arvind KumarPandey",
                            rsCounter: "Rs 4200")),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: _buildShivamBhargav(
                            shivamBhargav: "Shivam Bhargav",
                            rsCounter: "Rs 4200")),
                    const SizedBox(height: 8),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: _buildShivamBhargav(
                            shivamBhargav: "Mahima Dubey",
                            rsCounter: "Rs 4200")),
                    const SizedBox(height: 18),
                    SizedBox(
                        height: 121,
                        // width: 350,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child:PieChart(

                                dataMap: dataMap,
                              )),
                          Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                  width: 350,
                                  child: Divider(
                                      color: theme.colorScheme.primaryContainer
                                          .withOpacity(1)))),
                          Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 23, right: 27),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildEightyTwo(
                                            eightyTwo: "7600",
                                            classesCompleted:
                                            "Classes completed for your next earning"),
                                        Padding(
                                            padding:
                                            const EdgeInsets.only(left: 11),
                                            child: SizedBox(
                                                height: 67,
                                                child: VerticalDivider(
                                                    width: 1,
                                                    thickness: 1,
                                                    color: theme.colorScheme
                                                        .primaryContainer
                                                        .withOpacity(0.2),
                                                    indent: 7,
                                                    endIndent: 2))),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, top: 6),
                                            child: _buildEightyTwo(
                                                eightyTwo: "82%",
                                                classesCompleted:
                                                "Classes completed for your next earning"))
                                      ])))
                        ]))
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildAnkitShuklaTwo() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: AppDecoration.fillPrimary2
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ankit Shukla + 2",
                            style: CustomTextStyles.labelLargeBlack900SemiBold),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                                height: 6,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primaryContainer
                                        .withOpacity(0.44),
                                    borderRadius: BorderRadius.circular(3)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3),
                                    child: LinearProgressIndicator(
                                        value: 0.77,
                                        backgroundColor: theme
                                            .colorScheme.primaryContainer
                                            .withOpacity(0.44),
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            theme.colorScheme.primary)))))
                      ])),
              const SizedBox(height: 23),
              Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: _buildZipcode(
                      zipcodeText: "4800",
                      totalPaymentForText: "Total Payment for assigned hours",
                      hoursCompletedText: "18/20",
                      totalHoursCompletedText: "Total Hours completed",
                      paymentAsPerHourText: "4200",
                      paymentAsPerHourCompletedText:
                      "Payment as per hour completed")),
              SizedBox(height: 26),
              RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Your redeem request is ",
                        style: CustomTextStyles.bodySmallff000000),
                    TextSpan(
                        text: "approved!",
                        style: CustomTextStyles.labelLargeff00c838)
                  ]),
                  textAlign: TextAlign.left),
              SizedBox(height: 2)
            ]));
  }

  /// Section Widget
  Widget _buildRequestRedeem() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: AppDecoration.fillPrimary2
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 7),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ankit Shukla + 2",
                            style: CustomTextStyles.labelLargeBlack900SemiBold),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: Container(
                                height: 6,
                                width: 140,
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primaryContainer
                                        .withOpacity(0.44),
                                    borderRadius: BorderRadius.circular(3)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3.h),
                                    child: LinearProgressIndicator(
                                        value: 0.77,
                                        backgroundColor: theme
                                            .colorScheme.primaryContainer
                                            .withOpacity(0.44),
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(
                                            theme.colorScheme.primary)))))
                      ])),
              const SizedBox(height: 23),
              Padding(
                  padding: EdgeInsets.only(right: 7),
                  child:_buildZipcode(
                      zipcodeText: "4800",
                      totalPaymentForText: "Total Payment for assigned hours",
                      hoursCompletedText: "18/20",
                      totalHoursCompletedText: "Total Hours completed",
                      paymentAsPerHourText: "4200",
                      paymentAsPerHourCompletedText:
                      "Payment as per hour completed")),
              SizedBox(height: 18),
              CustomElevatedButton(
                  height: 21,
                  width: 130,
                  text: "Request Redeem",
                  margin: EdgeInsets.only(right: 7),
                  buttonTextStyle:
                  CustomTextStyles.labelLargePrimaryContainerSemiBold_1),
              SizedBox(height: 5)
            ]));
  }

  /// Common widget
  Widget _buildShivamBhargav({
    required String shivamBhargav,
    required String rsCounter,
  }) {
    return Container(
      width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 11),
        decoration: AppDecoration.outlineBlack90017
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder7),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: Text(shivamBhargav,
                      style: CustomTextStyles
                          .bodyMediumMontserratPrimaryContainer
                          .copyWith(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(1)))),
              Padding(
                  padding: const EdgeInsets.only(left: 12, top: 1),
                  child: Text(rsCounter,
                      style: CustomTextStyles
                          .titleSmallPrimaryContainerSemiBold_1
                          .copyWith(
                          color: theme.colorScheme.primaryContainer
                              .withOpacity(1)))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.fromLTRB(26, 8, 2, 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder3),
                  child: Container(
                      height: 2,
                      width: 30,
                      decoration: AppDecoration.outlineBlack9005.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder3),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                                // width: 60,
                                child: Divider(
                                    color: theme.colorScheme.primaryContainer
                                        .withOpacity(1))))
                      ])))
            ]));
  }

  /// Common widget
  Widget _buildEightyTwo({
    required String eightyTwo,
    required String classesCompleted,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(eightyTwo,
              style: CustomTextStyles.titleLargePrimaryContainerSemiBold
                  .copyWith(
                  color:
                  theme.colorScheme.primaryContainer.withOpacity(1)))),
      const SizedBox(height: 14),
      SizedBox(
          width: 83,
          child: Text(classesCompleted,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodySmallPrimaryContainer8.copyWith(
                  color: theme.colorScheme.primaryContainer.withOpacity(1),
                  height: 1.13)))
    ]);
  }

  /// Common widget
  Widget _buildZipcode({
    required String zipcodeText,
    required String totalPaymentForText,
    required String hoursCompletedText,
    required String totalHoursCompletedText,
    required String paymentAsPerHourText,
    required String paymentAsPerHourCompletedText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              decoration: AppDecoration.outlineBlack9007
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(zipcodeText,
                            style: CustomTextStyles.titleLargeLightblueA400
                                .copyWith(color: appTheme.lightBlueA400))),
                    const SizedBox(height: 7),
                    SizedBox(
                        width: 71,
                        child: Text(totalPaymentForText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmall8_1.copyWith(
                                color: appTheme.black900, height: 1.55)))
                  ]))),
      Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 11),
              decoration: AppDecoration.outlineBlack9007
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: Text(hoursCompletedText,
                            style: CustomTextStyles.titleLargeLightblueA400
                                .copyWith(color: appTheme.lightBlueA400))),
                    const SizedBox(height: 7),
                    Container(
                        width: 46,
                        margin: const EdgeInsets.only(left: 2),
                        child: Text(totalHoursCompletedText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: CustomTextStyles.bodySmall8_1.copyWith(
                                color: appTheme.black900, height: 1.55)))
                  ]))),
      Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
              decoration: AppDecoration.outlineBlack9007
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(paymentAsPerHourText,
                    style: CustomTextStyles.titleLargeLightblueA400
                        .copyWith(color: appTheme.lightBlueA400)),
                const SizedBox(height: 7),
                SizedBox(
                    width: 65,
                    child: Text(paymentAsPerHourCompletedText,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodySmall8_1
                            .copyWith(color: appTheme.black900, height: 1.55)))
              ])))
    ]);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
