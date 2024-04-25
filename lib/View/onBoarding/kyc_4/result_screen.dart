import 'package:edushalaacademy/View/main_actity.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/View/widgets/thanku_popop.dart';
import 'package:edushalaacademy/controllers/virtual/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_rating_bar.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final PayController payController = Get.put(PayController());
  Map<String, dynamic>? paymentData;

  @override
  void initState() {
    // Call the method to fetch payment data when the screen initializes
    fetchPaymentData();
    super.initState();
  }
  Future<void> fetchPaymentData() async {
    try {
      paymentData = await payController.fetchPaymentData();
      setState(() {}); // Update the UI with the fetched data
    } catch (e) {
      // Handle the error, e.g., show an error message
      print('Error fetching payment data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (paymentData != null) {
      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 48.w),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 24.h,
                          ),
                          child: Text(
                            "Access unlimited student near your Home",
                            // maxLines: 2,
                            style: CustomTextStyles
                                .headlineSmallMontserratOnSecondaryContainer,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Benefits of ",
                                  style: CustomTextStyles.titleLargeff140202,
                                ),
                                TextSpan(
                                  text: "EduShala",
                                  style: CustomTextStyles.titleLargeff00c1ff,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 17.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: _buildLoremIpsumDolor(
                          loremIpsumText:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing  consectetur adipiscing ",
                        ),
                      ),
                      SizedBox(height: 9.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: _buildLoremIpsumDolor(
                          loremIpsumText:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing  consectetur adipiscing ",
                        ),
                      ),
                      SizedBox(height: 9.w),
                      // _buildLoremIpsumDolor3(),
                      // SizedBox(height: 9.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: _buildLoremIpsumDolor(
                          loremIpsumText:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing  consectetur adipiscing ",
                        ),
                      ),
                      SizedBox(height: 9.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: _buildLoremIpsumDolor(
                          loremIpsumText:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing  consectetur adipiscing ",
                        ),
                      ),
                      SizedBox(height: 33.w),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Wall of ",
                                  style: CustomTextStyles.titleLargeff140202,
                                ),
                                TextSpan(
                                  text: "Love",
                                  style: CustomTextStyles.titleLargeff00c1ff,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.w),
                      _buildUserProfile(),
                      SizedBox(height: 104.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildFortyFive(),
      );
    }else{
      return  Center(
        child: MyCircularProgressIndicator(), // Show a loading indicator while fetching the data
      );
    }

  }

  /// Section Widget
  Widget _buildLoremIpsumDolor3() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.w),
            child: CustomIconButton(
              height: 20.w,
              width: 20.h,
              padding: EdgeInsets.all(7.h),
              decoration: IconButtonStyleHelper.fillLightBlueATL10,
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup46412Primarycontainer,
              ),
            ),
          ),
          Container(
            height: 32.w,
            width: 309.h,
            margin: EdgeInsets.only(left: 12.h),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 309.h,
                    child: Text(
                      "msg_lorem_ipsum_dolor",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 309.h,
                    child: Text(
                      "msg_lorem_ipsum_dolor",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall!.copyWith(
                        height: 1.25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 181.w,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 25.h),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 13.h,
                  vertical: 12.w,
                ),
                decoration: AppDecoration.outlineLightBlueA.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder13,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgPlay,
                      height: 41.w,
                      width: 41.h,
                      margin: EdgeInsets.only(bottom: 82.w),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10.h,
                        top: 4.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mahendra Dhume",
                            style: CustomTextStyles.labelMediumBlack90011,
                          ),
                          SizedBox(height: 2.w),
                          Text(
                            "Teacher of Physics",
                            style: CustomTextStyles.bodySmall8,
                          ),
                          SizedBox(height: 8.w),
                          SizedBox(
                            width: 179.h,
                            child: Text(
                              "It was really a Great App, with great features. It was really a Great App, with great features. ",
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.labelLargeBlack900_6,
                            ),
                          ),
                          SizedBox(height: 8.w),
                          CustomRatingBar(
                            ignoreGestures: true,
                            initialRating: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyFive() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.w,
      ),
      decoration: AppDecoration.outlineBlack9003,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 22.w,
                  // width: 64.h,
                  margin: EdgeInsets.only(bottom: 15.w),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Rs ${paymentData!['amount']}",
                          style: CustomTextStyles.titleMediumBold_1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 17.w,
                          width: 64.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: Divider(
                                    color: theme.colorScheme.errorContainer
                                        .withOpacity(1),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  child: Divider(
                                    color: theme.colorScheme.errorContainer
                                        .withOpacity(1),
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
                Padding(
                  padding: EdgeInsets.only(left: 23.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rs ${paymentData!['referrail_discount']}",
                        style: CustomTextStyles.titleMediumBold_1,
                      ),
                      SizedBox(height: 1.w),
                      Text(
                        "(Referral Discount)",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Flexible(child: Text("Processing Fee",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),))
              ],
            ),
          ),
          SizedBox(height: 9.w),
          CustomElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return customThankPopup(context, onTap: () {
                    payController.payPayment().then((value) {
                      Get.offAll(const MainActivity());
                    });
                  },
                      title2: "Thank You!",
                      submit: "Go to Homepage",
                      subtitle:
                          "Your verification & onboarding on Edushala is completed now. ");
                },
              );
            },
            text: "Pay Now",
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          ),
          SizedBox(height: 6.w),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildLoremIpsumDolor({required String loremIpsumText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 12.w),
          child: CustomIconButton(
            height: 20.w,
            width: 20.h,
            padding: EdgeInsets.all(7.h),
            decoration: IconButtonStyleHelper.fillLightBlueATL10,
            child: CustomImageView(
              color: Colors.white,
              imagePath: ImageConstant.imgGroup46412Primarycontainer,
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 309.h,
            margin: EdgeInsets.only(left: 12.h),
            child: Text(
              loremIpsumText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall!.copyWith(
                color: appTheme.black900,
                height: 1.25,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
