import 'package:edushalaacademy/View/Student/complte_onboarding_st.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/StudentController/pakege_details_controller.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class ProceedPaymentPage extends StatefulWidget {
  const ProceedPaymentPage({super.key});

  @override
  State<ProceedPaymentPage> createState() => _ProceedPaymentPageState();
}

class _ProceedPaymentPageState extends State<ProceedPaymentPage> {
  final PackageDetails controller = Get.put(PackageDetails());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 198.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      // height: 500,
                      child: Stack(
                        children: [
                          const Image(
                            image:
                                AssetImage("assets/images/Group 46750 (3).png"),
                            // width: MediaQuery.of(context).size.width,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            top: 70,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                        text: "Access ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Montserrat")
                                        // style: CustomTextStyles.headlineSmallff140202_1,
                                        ),
                                    TextSpan(
                                        text: " limitless tutors ",
                                        style: TextStyle(
                                            color: theme.primaryColor,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Montserrat")),
                                    const TextSpan(
                                        text: "you actually like",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Montserrat")),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // _buildContent(),
                    SizedBox(height: 10.h),
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
                              style:
                                  CustomTextStyles.titleMediumff000000SemiBold,
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
                              onPressed: () {
                              },
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
      bottomNavigationBar: _buildScheduleDemo(controller),
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
          SizedBox(height: 10.h),
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
            Icon(
              Icons.auto_graph,
              color: Colors.red,
            ),

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
                          Text(
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
                      Spacer(),
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


Widget _buildScheduleDemo(PackageDetails controller) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 20.w,
      vertical: 16.h,
    ),
    decoration: AppDecoration.outlineBlack90011,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.w),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Home Tuition for ",
                  style: CustomTextStyles.titleMediumff000000SemiBold,
                ),
                TextSpan(
                    text: "Class 5 \n(Academics) ",
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 18,
                        fontFamily: "Montserrat")),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            "5 hrs | 5 days a week | 21 days a month",
            style: theme.textTheme.bodyMedium,
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Row(
            children: [
              SizedBox(
                height: 22.h,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Text(
                      "Rs 200",
                      style: theme.textTheme.titleMedium,
                    ),
                     Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 50,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23.w),
                child: Text(
                  "Rs 12000",
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.h),
        Obx(
          () => controller.isLoadingPay.value ? Center(child: MyCircularProgressIndicator()):CustomElevatedButton(
            onPressed:() {
              controller.paymentPay().then((value) {
                if(value["is_error"]==false){
                  Fluttertoast.showToast(msg: value["message"].toString());
                  Get. to(()=>const StudentOnboardingSuccess());
                }else{

                }
                print(value);
              });
            },
            text: "Proceed Payment",
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          ),
        ),
        SizedBox(height: 9.h),
      ],
    ),
  );
}


