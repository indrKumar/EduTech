import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/app_bar/appbar_trailing_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';

class StHomePage extends StatefulWidget {
  const StHomePage({super.key});

  @override
  State<StHomePage> createState() => _StHomePageState();
}

class _StHomePageState extends State<StHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
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
                      // _buildKYCForm(),
                      _buildYourJourneyEduShala(),
                      SizedBox(height: 22.w),
                      _buildMoreOnEduShala(),
                      SizedBox(height: 29.w),
                      _buildLinkpageOne(),
                      SizedBox(height: 29.w),
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
            padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
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
                        child: Stack(
                          children: [
                            Positioned(
                                right: 0,
                                left: 0,
                                child: Image(
                                  image: AssetImage(ImageConstant.img91885331),
                                  fit: BoxFit.cover,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ]),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: CustomElevatedButton(
        text: "Switch Student",
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return bottomSwitch(context);
            },
          );
        },
        width: 206,
        leftIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.loop,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  int indexC = -1;

  Widget bottomSwitch(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 17.h,
          vertical: 19.w,
        ),
        decoration: AppDecoration.fillPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL25,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 66.w,
                child: Divider(
                  color: appTheme.black900.withOpacity(0.4),
                ),
              ),
              SizedBox(height: 43.h),
              ListView.builder(
                itemCount: 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        indexC = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 4.w,
                        right: 3.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 19.w,
                        vertical: 9.h,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.04),
                          border: Border.all(color: theme.primaryColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 1.h),
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: Colors.grey),
                            child: const Icon(Icons.person),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 15.w,
                              top: 5.h,
                              bottom: 4.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Abhishek Malviya",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "Montserrat")),
                                SizedBox(height: 3.h),
                                const Text("Tutor Assigned",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: "Montserrat")),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(
                              top: 14.h,
                              bottom: 12.h,
                            ),
                            decoration: indexC != index
                                ? BoxDecoration(
                                    color: theme.colorScheme.primaryContainer
                                        .withOpacity(1),
                                    borderRadius: BorderRadius.circular(
                                      5.w,
                                    ),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.w),
                                    color: theme.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                text: "Add new student",
                margin: EdgeInsets.only(right: 6.w),
                decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
              ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                onPressed: () {
                  Get.back();
                },
                text: "Cancel",
                margin: EdgeInsets.only(right: 6.w),
                buttonTextStyle: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15),
                decoration: const BoxDecoration(
                  // color:
                ),
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
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
        ],
      ),
    );
  }

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
                            style: CustomTextStyles.bodySmallPrimaryContainer_1,
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

  Widget _buildLinkpageOne() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.symmetric(
        horizontal: 22.w,
        vertical: 17.h,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder7,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 81.w),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWaistUpPortrait,
                  height: 58,
                  width: 58,
                  radius: BorderRadius.circular(
                    29.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 22.w,
                    top: 7.h,
                    bottom: 7.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ankit Saxena",
                        // style: CustomTextStyles.titleMediumSemiBold_1,
                      ),
                      SizedBox(height: 7.h),
                      RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Today ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: "|  8:30 pm - 9:30 pm",
                            style: CustomTextStyles.labelLargeBlack900_1,
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(
              left: 4.w,
              right: 3.w,
            ),
            child: Row(
              children: [
                Text(
                  "Class Link",
                  style: CustomTextStyles.bodySmallGray50001,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 11.h,
                      bottom: 2.h,
                    ),
                    child: Divider(
                      indent: 29.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 15.w,
            ),
            child: CustomTextFormField(
              readOnly: true,
              // controller: controller.linkpageOneController,
              hintText: "https://meet.google.com/ggg-sgf-rth",
              textInputAction: TextInputAction.done,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.w, 10.h, 10.w, 11.h),
                  child: const Icon(Icons.link_rounded)),
              suffixConstraints: BoxConstraints(
                maxHeight: 45.h,
              ),
              contentPadding: EdgeInsets.only(
                left: 17.w,
                top: 15.h,
                bottom: 15.h,
              ),
            ),
          ),
          SizedBox(height: 35.h),
          CustomElevatedButton(
            text: "Join Now",
            margin: EdgeInsets.only(
              left: 4.w,
              right: 2.w,
            ),
            // buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainerMedium,
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }

  Widget _buildYourJourneyEduShala() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 28.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your journey ",
                    style: CustomTextStyles.titleLargeBlack900Bold,
                  ),
                  TextSpan(
                    text: "@EduShala ",
                    style: CustomTextStyles.titleLargeff1356c5Bold,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.totalst,
                height: 70.h,
                alignment: Alignment.bottomRight,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 19.w,
                  top: 7.h,
                  bottom: 7.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "5",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Total Students",
                      style: CustomTextStyles.bodySmall9,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const Divider(),
          SizedBox(height: 15.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.totalc,
                height: 70.h,
                alignment: Alignment.bottomRight,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 19.w,
                  top: 7.h,
                  bottom: 7.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "157",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat"),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Total Classes Conducted",
                      style: CustomTextStyles.bodySmall9,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget workingDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      "32",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "Total Hours",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
                child: Column(
                  children: [
                    Text(
                      "32",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Text(
                      "Total Classes",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
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
                Text(
                  "16",
                  style: CustomTextStyles.bodyLarge18,
                ),
                Text(
                  "Regular Classes",
                  style: CustomTextStyles.bodySmall8,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "4",
                  style: CustomTextStyles.bodyLarge18,
                ),
                Text(
                  "Leaves by Student/ Tutor",
                  style: CustomTextStyles.bodySmall8,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "3",
                  style: CustomTextStyles.bodyLarge18,
                ),
                Text(
                  "Recovery Classes for Tutor",
                  style: CustomTextStyles.bodySmall8,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
