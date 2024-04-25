import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_outlined_button.dart';

class ContactUsCounsellor extends StatefulWidget {
  const ContactUsCounsellor({super.key});

  @override
  State<ContactUsCounsellor> createState() => _ContactUsCounsellorState();
}

class _ContactUsCounsellorState extends State<ContactUsCounsellor> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 26.h),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(children: [
                                            CustomImageView(
                          imagePath: ImageConstant.imgArrowLeft,
                          width: 7.w,
                          color: Colors.white,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 21.w),
                          onTap: () {
                            onTapImgArrowLeft();
                          }),
                                            Text("Contact Us",
                          style: CustomTextStyles.titleLargePrimaryContainer),
                                            SizedBox(height: 28.h),
                                            Container(
                          width: double.maxFinite,
                          // height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.h, vertical: 40.h),
                          decoration: AppDecoration.fillPrimaryContainer
                              .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // SizedBox(
                                //     height: 155.h,
                                //     width: 287.w,
                                //     child: Stack(
                                //         alignment: Alignment.bottomRight,
                                //         children: [
                                //           Align(
                                //               alignment: Alignment.topCenter,
                                //               child:
                                //         ])),
                          SizedBox(
                          child: RichText(
                          text:
                          TextSpan(children: [
                          const TextSpan(
                          text:
                          "I think your ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  color: Colors
                                      .black,
                                  fontFamily:
                                  "Montserrat")),
                          TextSpan(
                              text:
                              "requirement is for ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  color: Theme.of(
                                      context)
                                      .primaryColor,
                                  fontFamily:
                                  "Montserrat")),
                          const TextSpan(
                              text:
                              "multiple students ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight
                                      .bold,
                                  color: Colors
                                      .black,
                                  fontFamily:
                                  "Montserrat")),
                          ]),
                        textAlign:
                        TextAlign.center)),
                                const SizedBox(height: 50,),
                                // CustomImageView(
                                //     imagePath: ImageConstant
                                //         .img42746402,
                                //     width: 117.h,
                                //     alignment:
                                //     Alignment.bottomRight,
                                //     margin: EdgeInsets.only(
                                //         bottom: 13.v)),
                                CustomElevatedButton(
                                    height: 42.h,
                                    width: 184.w,
                                    text: "Call Now",
                                    alignment:
                                    Alignment.bottomCenter),
                                SizedBox(height: 11.h),
                                Text("Or",
                                    style:
                                        CustomTextStyles.titleMediumPrimary),
                                SizedBox(height: 6.h),
                                CustomOutlinedButton(
                                    height: 42.h,
                                    width: 184.w,
                                    text: "Get Callback",
                                    decoration: const BoxDecoration(),
                                    // buttonStyle: CustomButtonStyles
                                    //     .outlinePrimary,
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumPrimary),
                                SizedBox(height: 37.h),
                                Container(
                                    // width: 258.w,
                                    margin: EdgeInsets.only(
                                        left: 50.w, right: 51.w),
                                    child: RichText(
                                        text: TextSpan(children: [
                                          const TextSpan(
                                              text: "Let our Experts ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat")),
                                          TextSpan(
                                              text:
                                                  "understand your requirements ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontFamily: "Montserrat")),
                                          const TextSpan(
                                              text: "better",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontFamily: "Montserrat")),
                                        ]),
                                        textAlign: TextAlign.center)),
                                SizedBox(height: 29.h),
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 40.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 28.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 45,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.grey.shade200,
                                              radius: 40,
                                              child: const Icon(
                                                Icons.person,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                          // CustomImageView(
                                          //     imagePath: ImageConstant
                                          //         .imgImage215,
                                          //     height: 60.adaptSize,
                                          //     width: 60.adaptSize,
                                          //     radius:
                                          //     BorderRadius.circular(
                                          //         30.h)),
                                          SizedBox(height: 9.h),
                                          Text("Abhishek Malviya",
                                              style: CustomTextStyles
                                                  .titleSmallPrimaryContainer),
                                          Text("Customer Success Executive",
                                              style: CustomTextStyles
                                                  .bodySmallPrimaryContainer),
                                          SizedBox(height: 8.h),
                                          CustomElevatedButton(
                                              height: 19.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: 81.w,
                                              text: "WhatsApp",
                                              leftIcon: Container(
                                                margin: EdgeInsets.only(
                                                    right: 5.w),
                                                child: SvgPicture.asset(
                                                  ImageConstant.imgWhatsapp71,
                                                  height: 15.h,
                                                  width: 15.w,
                                                ),
                                              ),
                                              buttonTextStyle:
                                                  CustomTextStyles
                                                      .bodySmall8_2),
                                          SizedBox(height: 6.h)
                                        ])),
                                SizedBox(height: 41.h),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 59.w),
                                      child: const Text(
                                          "Whats the need of call for just a tutor/enquiry ?",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontFamily: "Montserrat")),
                                    )),
                                SizedBox(height: 41.h),
                                _buildFiftySeven()
                              ]))
                                          ]),
                      ))
                ]))));
  }

  /// Section Widget
  Widget _buildFiftySeven() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),/
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 22.h),
            decoration:  BoxDecoration(color:const Color(0xFFE2EDFF),borderRadius: BorderRadius.circular(10)),
            // decoration: AppDecoration.fillBlue
            //     .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(right: 41.w),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding:
                                EdgeInsets.only(top: 10.h, bottom: 23.h),
                            child:const Icon(Icons.check_circle,color: Colors.green,size: 20,)),
                        Expanded(
                            child: Container(
                                width: 234.w,
                                margin: EdgeInsets.only(left: 16.w),
                                child: Text("Navigate the Diversity: Avoid Misguided Enquiries",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodyLargeBlack900)))
                      ])),
            )));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
