import 'dart:convert';

import 'package:edushalaacademy/View/Student/pending_inquries.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/View/widgets/student/bottom_sheet.dart';
import 'package:edushalaacademy/controllers/StudentController/pakege_details_controller.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_rating_bar.dart';

class PackageDetailsPage extends StatefulWidget {
  const PackageDetailsPage({super.key});

  @override
  State<PackageDetailsPage> createState() => _PackageDetailsPageState();
}

class _PackageDetailsPageState extends State<PackageDetailsPage> {
  PackageDetails packageDetails = Get.put(PackageDetails());

  Future get() async {
    await packageDetails.packageList();
    setState(() {});
  }

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(SharedPref.accessToken);
    }
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(height: 58.h),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 198.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          // height: 67.h,
                          // width: 307.w,
                          margin: EdgeInsets.only(left: 24.w),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  child: Text(
                                    "Access limitless tutors you actually like",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .headlineSmallMontserratOnSecondaryContainer,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 50,
                                // top: 50,
                                bottom: 5,
                                child: CustomElevatedButton(
                                  height: 25.h,
                                  width: 82.w,
                                  text: "Premium",
                                  // margin: EdgeInsets.only(bottom: 11.h),
                                  // buttonStyle:
                                  // CustomButtonStyles.fillLightBlueA,
                                  buttonTextStyle: CustomTextStyles
                                      .labelMediumPrimaryContainerMedium_1,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 28.h),
                      _buildRangeText(),
                      SizedBox(height: 34.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.w),
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
                      SizedBox(height: 18.h),
                      _buildUserProfile(),
                      SizedBox(height: 42.h),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Padding(
                      //     padding: EdgeInsets.only(left: 25.w),
                      //     child: RichText(
                      //       text: TextSpan(
                      //         children: [
                      //           TextSpan(
                      //             text: "lbl_benefits_of",
                      //             style: CustomTextStyles.titleLargeff140202,
                      //           ),
                      //           TextSpan(
                      //             text: "lbl_edushala",
                      //             style: CustomTextStyles.titleLargeff00c1ff,
                      //           ),
                      //         ],
                      //       ),
                      //       textAlign: TextAlign.left,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 17.h),
                      _buildEnquiryNow(),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                      //   child: _buildLoremIpsumDolor(
                      //     loremIpsumDolor: "msg_lorem_ipsum_dolor",
                      //   ),
                      // ),
                      // SizedBox(height: 9.h),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 24.w),
                      //   child: _buildLoremIpsumDolor(
                      //     loremIpsumDolor: "msg_lorem_ipsum_dolor",
                      //   ),
                      // ),
                      // SizedBox(height: 41.h),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      Container(
                        width: 278.w,
                        margin: EdgeInsets.only(
                          left: 25.w,
                          right: 86.w,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "See what is included in the ",
                                style: CustomTextStyles.titleLargeff140202,
                              ),
                              TextSpan(
                                text: "Premium",
                                style: CustomTextStyles.titleLargeff00c1ff,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      // ),
                      SizedBox(height: 18.h),
                      _buildFeatures(),
                      SizedBox(height: 45.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25.w),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Frequently Asked ",
                                  style: CustomTextStyles.titleLargeff140202,
                                ),
                                TextSpan(
                                  text: "Questions",
                                  style: CustomTextStyles.titleLargeff00c1ff,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 35.h),
                      _buildIsthereafreetrialavailable(),
                      SizedBox(height: 29.h),
                      Divider(
                        indent: 23.w,
                        endIndent: 23.w,
                      ),
                      SizedBox(height: 24.h),
                      // _buildContent(),
                      SizedBox(height: 24.h),
                      _buildDedicatedExperts(),
                      const SizedBox(
                        height: 24,
                      ),
                      _buildWellmanageeverythingsoyoudonth(),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Benefits of joining",
                                style: CustomTextStyles
                                    .titleMediumff000000SemiBold,
                              ),
                              TextSpan(
                                  text: " EduShala",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w700)
                                  // style: CustomTextStyles.titleMediumff1356c5,
                                  ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ListView.builder(
                          itemCount: 6,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _buildBenefitsFlow(
                                    consistentFlow:
                                        "Specific Subject vs All Subjects"),
                              )),
                      _buildAndYesWeHave(),
                      60.h.verticalSpace,
                      SizedBox(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Have any",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: "Montserrat"),
                                    ),
                                    TextSpan(
                                      text: " Questions",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: "Montserrat"),
                                    ),
                                    const TextSpan(
                                      text: " regarding us?",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Image(
                                  image: AssetImage(
                                ImageConstant.aroPng,
                              )),
                              CustomElevatedButton(
                                height: 42.h,
                                width: 184.w,
                                text: "Contact Us",
                                // buttonStyle: CustomButtonStyles.outlineBlack,
                                // alignment: Alignment.bottomCenter,
                              )
                            ],
                          ),
                        ),
                      )
                      // _buildLoremIpsumDolor(loremIpsumDolor: "loremIpsumDolorsss"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int isSelected = -1;

  Widget _buildRangeText() {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.w,
        right: 27.w,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 200.w,
          crossAxisCount: 2,
          mainAxisSpacing: 21.w,
          crossAxisSpacing: 21.w,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: packageDetails.packageDetails.value.length,
        itemBuilder: (context, index) {
          var text =
              "${packageDetails.packageDetails.value[index].price_start.toString()} - ${packageDetails.packageDetails.value[index].price_upto.toString()}";
          // RangetextItemModel model = controller.addBasicDetailsFiveModelObj
          //     .value.rangetextItemList.value[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 29.w,
                vertical: 17.h,
              ),
              decoration: isSelected == index
                  ? AppDecoration.outlineLightblueA4001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    )
                  : BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withOpacity(1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                          BoxShadow(
                            color: appTheme.black900.withOpacity(0.1),
                            spreadRadius: 2.h,
                            blurRadius: 2.h,
                            offset: const Offset(
                              0,
                              0,
                            ),
                          ),
                        ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 6.h),
                  // Obx(
                  //       () =>
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    // You can use other BoxFit options based on your requirement
                    child: Text(
                      packageDetails.packageDetails.value[index].name
                          .toString(),
                      style: CustomTextStyles.headlineMediumBlack900,
                    ),
                  ),
                  // ),
                  SizedBox(height: 13.h),
                  // Obx(
                  //       () =>
                  Text(
                    "${packageDetails.packageDetails.value[index].price_start.toString()} - ${packageDetails.packageDetails.value[index].price_upto.toString()}",
                    style:
                        CustomTextStyles.headlineMediumLightblueA400.copyWith(
                      fontSize: text.length > 20 ? 10.h : 13.w,
                    ),
                  ),

                  // ),
                  SizedBox(height: 3.h),
                  // Obx(
                  //       () =>
                  Text(
                    "Per Month",
                    // rangetextItemModelObj.perMonthText!.value,
                    style: CustomTextStyles.labelMediumBlack900Medium,
                  ),
                  // ),
                  5.h.verticalSpace,
                  GestureDetector(
                    onTap: () async {
                      var id = packageDetails.packageDetails[index].id;
                      await packageDetails.getTeachingExDetails(id: id);
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AddBasicDetailsBottomsheet(
                            id: id,
                            name: packageDetails.packageAboutDetails[0].name,
                            about: packageDetails.packageAboutDetails[0].about,
                          );
                        },
                      );
                    },
                    child: const Card(
                      color: Color(0XFF00C2FF),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Know More",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Montserrat"),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: Colors.white,
                            weight: 30,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      // ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile() {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        height: 165.h,
        child:
            // Obx(
            //       () =>
            ListView.separated(
          padding: EdgeInsets.only(left: 25.w),
          scrollDirection: Axis.horizontal,
          // physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              width: 20.w,
            );
          },
          itemCount: 4,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 281.h,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.w,
                    vertical: 12.h,
                  ),
                  decoration: AppDecoration.outlineLightBlueA.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder13,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgPlay,
                        height: 41,
                        width: 41,
                        margin: EdgeInsets.only(bottom: 82.h),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10.w,
                          top: 4.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Obx(
                            //       () =>
                            Text(
                              "Mahendra Dhume",
                              // userprofile10ItemModelObj.userName!.value,
                              style: CustomTextStyles.labelMediumBlack90011,
                            ),
                            // ),
                            SizedBox(height: 2.h),
                            // Obx(
                            //       () =>
                            Text(
                              "Teacher of Physics",
                              // userprofile10ItemModelObj.userRole!.value,
                              style: CustomTextStyles.bodySmall8,
                            ),
                            // ),
                            SizedBox(height: 8.h),
                            SizedBox(
                              width: 189.h,
                              child:
                                  // Obx(
                                  //       () =>
                                  Text(
                                "It was really a Great App, with great features. .",
                                // userprofile10ItemModelObj.userReview!.value,
                                // maxLines: 4,
                                // overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelLargeBlack900_6,
                              ),
                            ),
                            // ),
                            SizedBox(height: 8.h),
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
              ),
            );
          },
        ),
      ),
      // ),
    );
  }

  /// Section Widget
  Widget _buildEnquiryNow() {
    return SizedBox(
      width: double.maxFinite,
      child: Container(
        margin: EdgeInsets.only(top: 6.h),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 19.h,
        ),
        decoration: AppDecoration.outlineBlack9003,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Text(
                  "Need any help? ",
                  style: TextStyle(fontSize: 13),
                ),
                Text(
                  "Get free consultation",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 15.h),
            if (isSelected != -1)
              Obx(() {
                return packageDetails.isLoadingPay.value == true
                    ? MyCircularProgressIndicator()
                    : CustomElevatedButton(
                  onPressed: () {
                    PackageDetails()
                        .createEnquiry(packageDetails
                        .packageDetails.value[isSelected].id)
                        .then((value) {
                      Map<String, dynamic> response = jsonDecode(value);
                      if (kDebugMode) {
                        print(response);
                      }
                      if (response["is_error"] != null &&
                          response["is_error"] == false) {
                        Fluttertoast.showToast(msg: response["message"]);
                        Get.offAll(() => const PendingInquiries());
                      } else {
                        String errorMessage =
                            response["message"] ?? "An error occurred";
                        Fluttertoast.showToast(msg: errorMessage);
                      }
                    });
                    // Get.to(()=>const PendingInquiries());
                  },
                  text: "Select",
                  // buttonStyle: CustomButtonStyles.none,
                  decoration:
                  CustomButtonStyles.gradientPrimaryToBlueDecoration,
                );
              })
          ],
        ),
      ),
    );
  }

  Widget _buildFeatures() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      decoration: AppDecoration.fillGray10004.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 10.h,
            ),
            decoration: AppDecoration.fillLightblueA4001.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL10,
            ),
            child: Row(
              children: [
                Text(
                  "Features",
                  style: CustomTextStyles.labelLargePrimaryContainerSemiBold_1,
                ),
                const Spacer(),
                Text(
                  "Other Apps",
                  style: CustomTextStyles.labelLargePrimaryContainerSemiBold_1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 8.w,
                  ),
                  child: Text(
                    "Edushala",
                    style:
                        CustomTextStyles.labelLargePrimaryContainerSemiBold_1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: 17.w,
                right: 54.w,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // width: 75.w,
                    child: Text(
                      "Feature",
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style:
                          CustomTextStyles.labelLargeBlack900SemiBold.copyWith(
                        height: 1.92,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 56,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgClose,
                    height: 13,
                    color: Colors.red,
                    width: 13,
                  ),
                  const Spacer(
                    flex: 43,
                  ),
                  const Icon(
                    Icons.check_circle_outline,
                    size: 18,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }

  final List<bool> _isExpandedList = List.generate(
      4, (index) => false); // Initialize a list to track expansion states

  /// Section Widget
  Widget _buildIsthereafreetrialavailable() {
    return
        // Obx(
        //     () =>
        ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  _isExpandedList[index] =
                      value; // Update the expansion state for the specific tile
                });
              },
              trailing: Icon(
                _isExpandedList[index]
                    ? Icons.remove_circle_outline
                    : Icons.add_circle_outline_rounded,
                color: const Color(0xFF00C2FF),
              ),
              tilePadding: EdgeInsets.zero,
              title: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 11, right: 11),
                    child: Text(
                      "Is there a free trial available?",
                      style: CustomTextStyles.titleMediumInterGray90001,
                    ),
                  ),
                ],
              ),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 11.h, left: 11, right: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: 307.w,
                        margin: EdgeInsets.only(right: 35.w),
                        child: Text(
                          "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible.",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodyLargeInterBluegray500
                              .copyWith(
                            height: 1.50,
                          ),
                        ),
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

  Widget _buildDedicatedExperts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,
        vertical: 21.h,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Container(
            // width: 278.w,
            margin: EdgeInsets.only(
              left: 6.w,
              right: 37.w,
            ),
            child: Text(
              "2 Dedicated experts for every students",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 21.h),
          Padding(
            padding: EdgeInsets.only(left: 9.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 61.h,
                  width: 60.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgOutdoorsManPo,
                        width: 60.w,
                        radius: BorderRadius.circular(
                          30.w,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer
                                .withOpacity(1),
                            borderRadius: BorderRadius.circular(
                              30.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: appTheme.black900.withOpacity(0.25),
                                spreadRadius: 2.w,
                                blurRadius: 2.w,
                                offset: const Offset(
                                  0,
                                  4,
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
                  padding: EdgeInsets.only(top: 11.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Academic Expert",
                        style:
                            TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                        // style: CustomTextStyles.titleSmallSemiBold_1,
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        width: 176.w,
                        child: Text(
                          "Foe one on one teaching in the classes and the problem solving",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallBlack900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 21.h),
                  child: Text("01",
                      style: GoogleFonts.montaguSlab(
                          fontSize: 30, color: Colors.black26)),
                ),
              ],
            ),
          ),
          10.h.verticalSpace,
          Divider(
            indent: 9.w,
            endIndent: 5.w,
          ),
          10.h.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 9.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 61.h,
                  width: 60.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgOutdoorsManPo,
                        width: 60.w,
                        radius: BorderRadius.circular(
                          30.w,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer
                                .withOpacity(1),
                            borderRadius: BorderRadius.circular(
                              30.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: appTheme.black900.withOpacity(0.25),
                                spreadRadius: 2.w,
                                blurRadius: 2.w,
                                offset: const Offset(
                                  0,
                                  4,
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
                  padding: EdgeInsets.only(top: 11.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Academic Expert",
                        style:
                            TextStyle(fontSize: 14, fontFamily: "Montserrat"),
                        // style: CustomTextStyles.titleSmallSemiBold_1,
                      ),
                      SizedBox(height: 6.h),
                      SizedBox(
                        width: 176.w,
                        child: Text(
                          "Foe one on one teaching in the classes and the problem solving",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.bodySmallBlack900,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 21.h),
                  child: Text("02",
                      style: GoogleFonts.montaguSlab(
                          fontSize: 30, color: Colors.black26)),
                ),
              ],
            ),
          ),
          SizedBox(height: 13.h),
        ],
      ),
    );
  }

  Widget _buildWellmanageeverythingsoyoudonth() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
        vertical: 6.h,
      ),
      decoration: AppDecoration.fillLightblueA400.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Container(
            margin: EdgeInsets.only(
              left: 18.w,
              right: 31.w,
            ),
            child: const Text(
              "We’ll manage everything so you don’t have to",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700),
              // style: CustomTextStyles.titleMediumSemiBold_1,
            ),
          ),
          SizedBox(height: 24.h),
          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: 18.w, top: 7, bottom: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16.w),
                      child: Text(
                        "Conceptual learning is strong for Maths and Science both",
                        maxLines: 9,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge,
                      ),
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

  Widget _buildBenefitsFlow({required String consistentFlow}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 13.h,
        ),
        decoration: AppDecoration.outlineGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(
              Icons.auto_graph,
              color: Colors.red,
            ),
            // CustomImageView(
            //   imagePath: ImageConstant.imgGraphPngImagesHd,
            //   height: 24.v,
            //   margin: EdgeInsets.only(top: 1.v),
            // ),
            Padding(
              padding: EdgeInsets.only(
                left: 21.w,
                top: 3.h,
                bottom: 3.h,
              ),
              child: Text(
                consistentFlow,
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAndYesWeHave() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 15.h,
      ),
      decoration: AppDecoration.fillLightblueA400,
      child: Column(
        children: [
          Container(
            width: 254.w,
            margin: EdgeInsets.only(
              left: 47.w,
              right: 49.w,
            ),
            child: Text(
              "And yes! We have made it affordable",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleMediumSemiBold,
            ),
          ),
          SizedBox(height: 41.h),
          Container(
            margin: EdgeInsets.only(right: 1.w),
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: const Text(
                    "Other private class",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat"),
                    // style: CustomTextStyles.titleSmallSemiBold,
                  ),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "General private class with just a teacher",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: "Montserrat",
                        color: Colors.grey.shade600),
                    // style: CustomTextStyles.labelMediumGray50002,
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 4.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        radius: 20,
                      ),
                      // CustomImageView(
                      //   imagePath: ImageConstant.imgOutdoorsManPo42x41,
                      //   width: 41.h,
                      //   radius: BorderRadius.circular(
                      //     20.h,
                      //   ),
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Minimum",
                            // style: CustomTextStyles.labelMediumGray50002,
                          ),
                          SizedBox(height: 8.h),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "Rs 1,200",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700)
                                    // style: CustomTextStyles
                                    //     .titleSmallff000000SemiBold,
                                    ),
                                TextSpan(
                                    text: "/Hour",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500)
                                    // style: CustomTextStyles.bodySmallffa1a1a1,
                                    ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 62.h,
                  width: 301.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 301.w,
                          child: Divider(
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFFFFECD0),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFFFD99F),
                          radius: 15,
                          child: Text(
                            "Vs",
                            // style: CustomTextStyles.titleMediumSemiBold19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: const Text(
                    "Edushala",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat"),
                  ),
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    "Experts with having experties in their specilization",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: "Montserrat",
                        color: Colors.grey.shade600),
                  ),
                ),
                SizedBox(height: 44.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    right: 3.w,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: _buildOutdoorsManPo(),
                      ),
                      10.h.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: _buildOutdoorsManPo(),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Starts from",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600),
                              // style: CustomTextStyles.labelMediumGray50002,
                            ),
                            SizedBox(height: 7.h),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Rs 600",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700)
                                      // style: CustomTextStyles
                                      //     .titleSmallff000000SemiBold,
                                      ),
                                  TextSpan(
                                      text: "/Hour",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500)
                                      // style: CustomTextStyles.bodySmallffa1a1a1,
                                      ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 29.h),
              ],
            ),
          ),
          SizedBox(height: 34.h),
        ],
      ),
    );
  }

  Widget _buildOutdoorsManPo() {
    return SizedBox(
      height: 43.h,
      width: 46.w,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 20,
          ),
          Image(
              image: AssetImage(
            ImageConstant.imgFavorite,
          ))
        ],
      ),
    );
  }
}
