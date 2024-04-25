import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(28),
        child: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios,color: Colors.white)),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
              // SizedBox(height: 26),
              Expanded(
                  child: SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                        CustomImageView(
                            imagePath:
                            ImageConstant.imgArrowLeftPrimarycontainer,
                            height: 12,
                            width: 7,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 21),
                            onTap: () {
                              onTapImgArrowLeft();
                            }),
                        Text("Contact Us",
                            style: CustomTextStyles
                                .titleLargePrimaryContainer),
                        const SizedBox(height: 28),
                        _buildUserProfile()
                      ])))
            ])));
  }

  List list = [
    "Suggestion",
    "Feedback",
    "Complaints"
  ];
  /// Section Widget
  Widget _buildUserProfile() {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 2),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(1),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15))
            ),
            child:  ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 38);
                },
                itemCount:5,
                itemBuilder: (context, index) {
                    return SizedBox(
                      height: 163.h,
                      width: 349.w,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 10.h,
                              ),
                              decoration: AppDecoration.outlineBlack90026.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder10,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 63.w),
                                    child: Text(
                                            "Abhishek Malviya",
                                        style: CustomTextStyles.titleSmallPrimaryContainerBold,
                                      ),
                                    ),
                                  SizedBox(height: 3.h),
                                  Padding(
                                    padding: EdgeInsets.only(right: 49.w),
                                    child: Text(
                                      "Customer Success Executive",
                                        style: CustomTextStyles.bodySmallPrimaryContainer10,
                                      ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: EdgeInsets.only(right: 23.h,bottom: 20),
                                    child: Wrap(
                                        runSpacing: 4.59.h,
                                        spacing: 4.59.w,
                                        children: List<Widget>.generate(
                                         3,
                                              (index) {
                                            return
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    border: Border.all(color:  Colors.white,
                                                )),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 11,
                                                    vertical: 5
                                                  ),
                                                  child: Text(
                                                    list[index].toString(),
                                                    style: TextStyle(
                                                      color: theme.colorScheme.primaryContainer.withOpacity(1),
                                                      fontSize: 5.344144821166992,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              );
                                          },
                                        ),
                                      ),
                                  ),
                                  // SizedBox(height: 25.h),
                                  Padding(
                                    padding: EdgeInsets.only(left: 6.w),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: CustomElevatedButton(
                                            decoration: BoxDecoration(color:Colors.white ,
                                              borderRadius: BorderRadius.all(Radius.circular(23.h)),
                                            ),
                                            height: 23.h,
                                            text: "Call",
                                            margin: EdgeInsets.only(right: 3.h),
                                            leftIcon: Container(
                                              margin: EdgeInsets.only(right: 6.h),
                                              child: SvgPicture.asset(
                                                ImageConstant.imgCall103,
                                                height: 15.h,
                                                width: 15.w,
                                              ),
                                            ),
                                            buttonTextStyle: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomElevatedButton(
                                            decoration: BoxDecoration(color:Colors.white ,
                                              borderRadius: BorderRadius.all(Radius.circular(23.h)),
                                            ),
                                            height: 23.h,
                                            text: "Whatsapp",
                                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                                            leftIcon: Container(
                                              margin: EdgeInsets.only(right: 6.w),
                                              child: SvgPicture.asset(
                                                 ImageConstant.imgWhatsapp71,
                                                height: 15.h,
                                                width: 15.w,
                                              ),
                                            ),
                                            buttonTextStyle: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomElevatedButton(
                                            decoration: BoxDecoration(color:Colors.white ,
                                              borderRadius: BorderRadius.all(Radius.circular(23.h)),
                                            ),
                                            height: 23.h,
                                            text: "Email",
                                            margin: EdgeInsets.only(left: 3.w),
                                            leftIcon: Container(
                                              margin: EdgeInsets.only(right: 6.w),
                                              child: SvgPicture.asset(
                                                ImageConstant.imgEmail31,
                                                height: 11.h,
                                                width: 15.w,
                                              ),
                                            ),
                                            buttonTextStyle: CustomTextStyles.bodySmall10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                ],
                              ),
                            ),
                          ),
                          CustomImageView(
                            imagePath: ImageConstant.imgImage213,
                            height: 98.h,
                            width: 98.w,
                            radius: BorderRadius.circular(
                              8.h,
                            ),border: Border.all(color: Colors.white,width: 3,),
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 24.h),
                          ),
                        ],
                      ),
                    );
                })));
  }

  /// Navigates to the previous screen.
  onTapImgArrowLeft() {
    Get.back();
  }
}
