import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:get/get.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return  Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                  image: DecorationImage(
                    image: fs.Svg(
                      ImageConstant.imgGroup882,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Text("How to register as tutor on EduShala",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.80),fontFamily: "Montserrat"),),
                    SizedBox(height: 5.h),
                   Text("There are many variations of Lore ipsum available",style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(0.80),fontFamily: "Montserrat"),),
                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 175.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgGradientELear175x315,
                            height: 175.h,
                            width: double.infinity,
                            radius: BorderRadius.circular(
                              9.w,
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 58.h,
                              ),
                              decoration: AppDecoration.fillBlack.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder7,
                              ),
                              child: CustomIconButton(
                                height: 59.h,
                                width: 59.w,
                                padding: EdgeInsets.all(5.h),
                                child: CustomImageView(
                                  color: Colors.white,
                                  imagePath: ImageConstant.imgPlay11,
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
            }));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 28.w,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 21.w, top: 22.h, bottom: 21.h),
            onTap: () {
              onTapArrowLeft();
            }),
        title: Padding(
            padding: EdgeInsets.only(left: 22.w),
            child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "EduShala ",
                      style: CustomTextStyles.titleSmallff000000_1),
                  TextSpan(
                      text: "Guide",
                      style: CustomTextStyles.titleSmallff000000)
                ]),
                textAlign: TextAlign.left)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
