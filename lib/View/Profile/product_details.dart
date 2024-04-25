import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_seven.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class OtherProductsDetails extends StatefulWidget {
  const OtherProductsDetails({super.key});

  @override
  State<OtherProductsDetails> createState() => _OtherProductsDetailsState();
}

class _OtherProductsDetailsState extends State<OtherProductsDetails> {
  int sliderIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 2.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children: [
              _buildWidget(),
              SizedBox(height: 17.h),
              SizedBox(
                height: 11.h,
                child: AnimatedSmoothIndicator(
                  activeIndex: sliderIndex,
                  count: 4,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                    spacing: 9,
                    activeDotColor: appTheme.lightBlueA400,
                    dotColor: appTheme.blueGray10004,
                    dotHeight: 11.h,
                    dotWidth: 11.w,
                  ),
                ),
              ),
              SizedBox(height: 27.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Product Description", style: CustomTextStyles.titleSmallBold),
              ),
              SizedBox(height: 8.h),
              _buildEnquiryNow(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  Container(
          padding:
          EdgeInsets.symmetric(horizontal: 20.w, vertical: 21.h),
          decoration: AppDecoration.outlineBlack9003,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 202.w,
                      child: Text("Test Series for MPPSC Paper 1 Test Series for MPPSC Paper 1",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.titleMediumSemiBold)),
                  Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal:11),
                      child: Text("Rs 1,999/-",
                          style: CustomTextStyles
                              .titleMediumLightblueA400Bold))
                ]),
            SizedBox(height: 21.h),
            CustomElevatedButton(
              onPressed:() {
                showCustomDialog(context);
              },
                text: "Enquiry Now",
                decoration:
                CustomButtonStyles.gradientPrimaryToBlueDecoration),
            SizedBox(height: 5.h)
          ])),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leadingWidth: 28.w,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeft,
        margin: EdgeInsets.only(left: 21.w, top: 21.h, bottom: 22.h),
        onTap: () {
          onTapArrowLeft();
        },
      ),
      title: AppbarSubtitleSeven(
        text: "Test Series for MPPSC Paper 1",
        margin: EdgeInsets.only(left: 22.w),
      ),
    );
  }

  Widget _buildWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 51.w),
      child: CarouselSlider.builder(
        carouselController: carouselController,
        options: CarouselOptions(
          height: 287,
          initialPage: sliderIndex,
          autoPlay: true,
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              sliderIndex = index;
            });
          },
        ),
        itemCount: 4,
        itemBuilder: (context, index, realIndex) {
          return CustomImageView(
            imagePath: ImageConstant.imgImage197,
            height: 287,
            width: 287,
            radius: BorderRadius.circular(10.h),
          );
        },
      ),
    );
  }
  /// Section Widget
  Widget _buildEnquiryNow() {
    return SizedBox(
        height: 417.h,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  child: Text("A day after the Centers for Disease Control and Prevention urged Americans to stay home for Thanksgiving, more than one million people in the United States got on planes, marking the second day that more than a million people have flown since March. Nearly three million additional people have flown in the days since.The high number of travelers speaks to a sense of pandemic fatigue that many people are experiencing. For some, the desire to see family is worth the risk of potentially getting the coronavirus while traveling.",
                      maxLines: 14,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyLargeInter
                          .copyWith(height: 1.50)))),

        ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 39,
              vertical: 28,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.blue, // Customize the color as needed
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                CustomImageView(
                  imagePath: ImageConstant.img1061064894Che,
                  height: 90,
                  width: 90,
                ),
                const SizedBox(height: 19),
                SizedBox(
                  width: 268,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Thank you!\n",
                          style: CustomTextStyles.titleMediumcc000000,
                        ),
                        TextSpan(
                          text: "Your enquiry has been submitted successfully. Our team will get back to you.",
                          style: CustomTextStyles.bodyLargecc000000,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
