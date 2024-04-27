import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_trailing_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
          children: [
            _buildWelcomeArvind(),
            const SizedBox(height: 23),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.w,
                        child: AnimatedSmoothIndicator(
                          activeIndex: 0,
                          count: 4,
                          effect: ScrollingDotsEffect(
                            spacing: 8,
                            activeDotColor: theme.colorScheme.primary,
                            dotColor: appTheme.blueGray10002,
                            dotHeight: 3.w,
                            dotWidth: 22.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.w),
                      _buildKYCForm(),
                      SizedBox(height: 22.w),
                      workingDetails(),
                      SizedBox(height: 42.w),
                      _buildKnowMore1(),
                      SizedBox(height: 22.w),
                      _buildMoreOnEduShala(),
                      SizedBox(height: 25.w),
                      _buildStart1(),
                      SizedBox(height: 29.w),
                      _buildEduShalaGuide(),
                      SizedBox(height: 14.w),
                      _buildRegistrationGuide(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 90,left: 10,right: 10),
              child: SizedBox(
                height: 161,
                child: SizedBox(
                  height: 161,
                  child: PageView.builder(
                    itemCount: 3, // Set the total number of items
                    itemBuilder: (context, index) {
                      return Card(
                        child: SizedBox(
                          height: 160,
                          child: Stack(children: [
                            Positioned(
                                right:0,
                                left: 0,
                                child: Image(image: AssetImage(ImageConstant.img91885331),fit: BoxFit.cover,))
                          ],),
                          // Your card content here
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

        ]
      ),
    );
  }

  Widget _buildWelcomeArvind() {
    return SizedBox(
      height: 268,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            height: 150,
            title: Container(
              // width: 150.h,
              margin: EdgeInsets.only(
                left: 20.h,
                top: 24.w,
                bottom: 131.w,
              ),
              decoration: AppDecoration.outlineBlack9005,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome ",
                      style: CustomTextStyles.titleMediumccffffff16,
                    ),
                    TextSpan(
                      text: "Arvind!",
                      style: CustomTextStyles.titleMediumffffffffBold,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgSupport11,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 5,
                  bottom: 131.h,
                ),
              ),
              // 20.h.horizontalSpace,
              AppbarTrailingImage(
                imagePath: ImageConstant.imgNotification2,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 5,
                  bottom: 131.h,
                ),
              ),
              20.h.horizontalSpace,
            ],
            styleType: Style.bgFill,
          ),

          //           CarouselSlider.builder(
          //     options: CarouselOptions(
          //       height: 183.v,
          //       initialPage: 0,
          //       autoPlay: true,
          //       viewportFraction: 1.0,
          //       enableInfiniteScroll: false,
          //       scrollDirection: Axis.horizontal,
          //       onPageChanged: (
          //           index,
          //           reason,
          //           ) {
          //         controller.sliderIndex.value = index;
          //       },
          //     ),
          //     itemCount: controller
          //         .homeModelObj.value.edushalaoneItemList.value.length,
          //     itemBuilder: (context, index, realIndex) {
          //       EdushalaoneItemModel model = controller
          //           .homeModelObj.value.edushalaoneItemList.value[index];
          //       return EdushalaoneItemWidget(
          //         model,
          //       );
          //     },
          // ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildKYCForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 11.w,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: 6.h,
              vertical: 21.w,
            ),
            decoration:
                AppDecoration.gradientErrorContainerToErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEdushala1,
                  height: 29.w,
                  width: 49.h,
                  margin: EdgeInsets.only(
                    left: 5.h,
                    bottom: 2.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.h),
                  child: SizedBox(
                    height: 31.w,
                    child: VerticalDivider(
                      width: 1.h,
                      thickness: 1.w,
                      color: theme.colorScheme.primaryContainer.withOpacity(1),
                      endIndent: 2.h,
                    ),
                  ),
                ),
                Container(
                  width: 164.h,
                  margin: EdgeInsets.only(left: 13.h),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Complete your KYC".tr,
                          style: CustomTextStyles.labelLargeff000000_1,
                        ),
                        TextSpan(
                          text: "start".tr,
                          style: CustomTextStyles.labelLargeff00c1ff,
                        ),
                        TextSpan(
                          text: "to start getting leads".tr,
                          style: CustomTextStyles.labelLargeff000000_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  height: 31.w,
                  width: 72.h,
                  text: "Start".tr,
                  decoration: CustomButtonStyles.gradientBlueToIndigoDecoration,
                  buttonTextStyle:
                      CustomTextStyles.labelLargePrimaryContainerSemiBold_1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildKnowMore() {
    return CustomElevatedButton(
      height: 22.w,
      width: 105.h,
      text: "Know More",
      buttonTextStyle: CustomTextStyles.labelLargePrimaryContainerSemiBold_2,
    );
  }

  /// Section Widget
  Widget _buildKnowMore1() {
    return SizedBox(
      height: 184.w,
      width: 380.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(right: 10.h),
              decoration: AppDecoration.outlineBlack9006.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Container(
                height: 184.w,
                // width: 339.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.h,
                  ),
                  gradient: LinearGradient(
                    begin: const Alignment(0.02, 0.5),
                    end: const Alignment(0.97, 0.5),
                    colors: [
                      theme.colorScheme.primaryContainer.withOpacity(1),
                      theme.colorScheme.primaryContainer.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgRectangle4232,
            height: 184.w,
            width: 332.h,
            alignment: Alignment.centerRight,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgUndrawSavingsReEq4w,
            height: 141.w,
            width: 164.h,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 12.w),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 31.h,
                // right: 177.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: 171.h,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Lifetime earnings \non ",
                            style: CustomTextStyles.titleMediumff00000019,
                          ),
                          TextSpan(
                            text: "Edushala",
                            style: CustomTextStyles.titleMediumff00c1ff19,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 14.w),
                  Text(
                    "Rs 44,573",
                    style: CustomTextStyles.titleMediumBold_2,
                  ),
                  SizedBox(height: 15.w),
                  _buildKnowMore(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // / Section Widget
  Widget _buildMoreOnEduShala() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 12.w,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "More on Edu Shala",
            style: CustomTextStyles.labelLargeBlack900,
          ),
          SizedBox(height: 17.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomIconButton(
                    height: 63.w,
                    width: 64.h,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.fillPrimaryContainer,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGroup239,
                    ),
                  ),
                  // SizedBox(height: 8.w),
                  Text(
                    "Reports",
                    style: CustomTextStyles.bodyMediumMontserratBlack900,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomIconButton(
                    height: 63.w,
                    width: 64.h,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.fillPrimaryContainer,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGroup239,
                    ),
                  ),
                  // SizedBox(height: 8.w),
                  Text(
                    "Reports",
                    style: CustomTextStyles.bodyMediumMontserratBlack900,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomIconButton(
                    height: 63.w,
                    width: 64.h,
                    padding: EdgeInsets.all(13.h),
                    decoration: IconButtonStyleHelper.fillPrimaryContainer,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGroup239,
                    ),
                  ),
                  // SizedBox(height: 8.w),
                  Text(
                    "Reports",
                    style: CustomTextStyles.bodyMediumMontserratBlack900,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.w),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStart() {
    return CustomElevatedButton(
      height: 21.w,
      width: 106.h,
      text: "Start",
      buttonTextStyle: CustomTextStyles.labelLargePrimaryContainerSemiBold_1,
    );
  }

  /// Section Widget
  Widget _buildStart1() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 15.w,
      ),
      decoration: AppDecoration.fillGray10003,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.w),
          Card(
            clipBehavior: Clip.antiAlias,
            // elevation: 0,
            color: theme.colorScheme.primaryContainer.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: Container(
              // height: 171.w,
              width: 370.h,
              decoration: AppDecoration.outlineBlack9007.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Positioned(
                    left: 0,
                    child: SvgPicture.asset(
                      ImageConstant.imgUndrawOnlineL,
                      height: 109.w,
                      width: 156.h,
                      alignment: Alignment.bottomLeft,
                      // margin: EdgeInsets.only(
                      //   left: 20.h,
                      //   bottom: 26.w,
                      // ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 66.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.h,
                      vertical: 26.w,
                    ),
                    decoration: AppDecoration
                        .gradientPrimaryContainerToPrimaryContainer1
                        .copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 3.w),
                        SizedBox(
                          // width: 132.h,
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Get your perfect\n",
                                  style: CustomTextStyles.titleMediumff000000,
                                ),
                                TextSpan(
                                  text: "home tuition \nleads ",
                                  style: CustomTextStyles.titleMediumff00c1ff16,
                                ),
                                TextSpan(
                                  text: "in just few \nclicks",
                                  style: CustomTextStyles.titleMediumff000000,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 14.w),
                        _buildStart(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEduShalaGuide() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "EduShala Guide",
            style: CustomTextStyles.titleMediumBold,
          ),
          Text(
            "View All",
            style: CustomTextStyles.titleSmallLightblueA400_1,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRegistrationGuide() {
    return SizedBox(
      height: 151.w,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 19.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 15.h,
          );
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 151.w,
            width: 232.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgGradientELear,
                  height: 128.w,
                  width: 231.h,
                  radius: BorderRadius.circular(
                    6.h,
                  ),
                  alignment: Alignment.topCenter,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.h,
                      vertical: 5.w,
                    ),
                    decoration: AppDecoration.gradientBlackToBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder7,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 32.w),
                        Text(
                            "How to register as tutor on ",
                            style:
                                CustomTextStyles.titleSmallPrimaryContainerBold,
                          ),
                        SizedBox(
                          width: 203.h,
                          child: Text(
                              "Watch step by step process to get registered on...",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  CustomTextStyles.bodySmallPrimaryContainer_1,
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }




  Widget workingDetails(){
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(5)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26,vertical: 5),
              child: Column(children: [
                Text(
                  "32",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                  ),
                ),
                Text("Total Hours", style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                ),),
              ],),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(5)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 26,vertical: 5),
              child: Column(children: [
                Text(
                  "32",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
                Text("Total Classes", style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                ),),
              ],),
            ),
          ),
        ],
      ),
    20.h.verticalSpace,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      Column(
        children: [
          Text("16",style:CustomTextStyles.bodyLarge18,),
          Text("Regular Classes",style:CustomTextStyles.bodySmall8,),
        ],
      ),Column(
        children: [
          Text("4",style:CustomTextStyles.bodyLarge18,),
          Text("Leaves by Student/ Tutor",style:CustomTextStyles.bodySmall8,),
        ],
      ),Column(
        children: [
          Text("3",style:CustomTextStyles.bodyLarge18,),
          Text("Recovery Classes for Tutor",style:CustomTextStyles.bodySmall8,),
        ],
      ),
    ],)
    ],);
  }
}
