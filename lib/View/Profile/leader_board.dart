import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_image_view.dart';

class LeaderboardsScreen extends StatefulWidget {
  const LeaderboardsScreen({super.key});

  @override
  State<LeaderboardsScreen> createState() => _LeaderboardsScreenState();
}

class _LeaderboardsScreenState extends State<LeaderboardsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white)),
        backgroundColor: Colors.transparent),
        body: Container(
            // width: SizeUtils.width,
            // height: SizeUtils.height,
            padding: EdgeInsets.only(top: 56.h),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: const Alignment(-0.09, 0),
                    end: const Alignment(0.94, 0.6),
                    colors: [
                      theme.colorScheme.primary,
                      appTheme.indigo700
                    ])),
            child: SingleChildScrollView(
                child: Column(children: [
                  20.h.verticalSpace,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: 70.h,
                          width: 310.w,
                          margin: EdgeInsets.only(left: 12.w),
                          child: Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgEdushala11,
                                    height: 70.h,
                                    width: 164.w,
                                    alignment: Alignment.centerLeft),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height: 62.h,
                                              child: VerticalDivider(
                                                  width: 1.w,
                                                  thickness: 1.h,
                                                  color: theme.colorScheme
                                                      .primaryContainer
                                                      .withOpacity(1),
                                                  indent: 1.w,
                                                  endIndent: 3.w)),
                                          Container(
                                              // width: 146.w,
                                              margin:
                                              EdgeInsets.only(left: 15.w),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text:
                                                        "Super Tutors of\n",
                                                        style: CustomTextStyles
                                                            .bodyLargeffffffff18),
                                                    TextSpan(
                                                        text:
                                                        "The Month",
                                                        style: CustomTextStyles
                                                            .headlineMediumffffffff)
                                                  ]),
                                                  textAlign: TextAlign.left))
                                        ]))
                              ]))),
                  SizedBox(height: 16.h),
                  Container(
                      decoration: AppDecoration.outlineBlack90022,
                      child: Text("December 2023",
                          style:
                          CustomTextStyles.displaySmallPrimaryContainer39)),
                  SizedBox(height: 31.h),
                  _buildView(),
                  SizedBox(height: 22.h),
                  _buildTwo()
                ]))));
  }


  /// Section Widget
  Widget _buildView() {
    return Container(
        width: 350.w,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 5.h),
        decoration: AppDecoration.fillPrimaryContainer2
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 17.h),
          Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  height: 234.h,
                  width: 246.w,
                  child: Stack(alignment: Alignment.topLeft, children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect( // Add ClipRRect for rounded clipping
                        borderRadius: BorderRadius.circular(99.0),
                        child: DottedBorder(
                          color: Colors.white, // Set border color
                          strokeWidth: 10.0, // Set border width
                          dashPattern: const [2.0, 5.0],
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 99.0,
                                child: CustomImageView(
                                  imagePath: ImageConstant.imgOutdoorsManPo192x191,
                                  // height: 192.h,
                                  // width: 191.w,
                                  radius: BorderRadius.circular(95),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            height: 30.h,
                            width: 204.w,
                            margin: EdgeInsets.only(left: 4.w),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer
                                    .withOpacity(0.11),
                                borderRadius: BorderRadius.circular(102.w)))),
                    Positioned(
                      top: 25,right: 25,
                      child: CircleAvatar(
                        radius: 26,
                          child: Center(
                            child: Text("01",
                                style: theme.textTheme.displayMedium),
                          )),
                    )
                  ]))),
          SizedBox(height: 6.h),
          Text("lbl_arvind_pandey",
              style: CustomTextStyles.displayMediumPrimaryContainer)
        ]));
  }

  /// Section Widget
  Widget _buildTwo() {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 31.h),
        decoration:
        BoxDecoration(color: theme.colorScheme.primaryContainer.withOpacity(1),borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius. circular(20))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  // height: 201.h,
                  // width: 176.w,
                  margin: EdgeInsets.only(left: 2.h, bottom: 56.h),
                  child: Stack(alignment: Alignment.centerLeft, children: [

                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(right: 29.w),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                      radius: 70,
                                      child: CustomImageView(
                                          imagePath: ImageConstant
                                              .imgOutdoorsManPo133x133,
                                          radius: BorderRadius.circular(66.w),
                                          alignment: Alignment.center)),

                                  SizedBox(height: 13.h),
                                  Text("Arvind Pandey",
                                      style: theme.textTheme.headlineSmall)
                                ]))),
                    Positioned(
                      right: 20,
                      top: 8,
                      child: CircleAvatar(
                        radius: 22,
                          child: Text("02",
                              style: theme.textTheme.displaySmall)),
                    ),
                  ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 56.h),
                  child: Column(children: [
                    SizedBox(
                        child: Stack(alignment: Alignment.topRight, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child:CircleAvatar(
                                  radius: 70,
                                  child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgOutdoorsManPo133x133,
                                      radius: BorderRadius.circular(66.w),
                                      alignment: Alignment.center)),),
                          Positioned(
                            // right: 20,
                            top: 8,
                            child: CircleAvatar(
                                radius: 22,
                                child: Text("03",
                                    style: theme.textTheme.displaySmall)),
                          ),
                        ])),
                    SizedBox(height: 13.h),
                    Text("Arvind Pandey",
                        style: theme.textTheme.headlineSmall)
                  ]))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}