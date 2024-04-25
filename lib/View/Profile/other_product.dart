import 'package:edushalaacademy/View/Profile/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_seven.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_image_view.dart';

class OtherProductsScreen extends StatefulWidget {
  const OtherProductsScreen({super.key});

  @override
  State<OtherProductsScreen> createState() => _OtherProductsScreenState();
}

class _OtherProductsScreenState extends State<OtherProductsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
            padding: EdgeInsets.only(left: 20.w, top: 22.h, right: 20.w),
            child:  ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 27.h);
                },
                itemCount: 4,
                itemBuilder: (context, index) {

                  return  CustomImageView(
                    onTap: () {
                      Get.to(()=>const OtherProductsDetails());
                    },
                    imagePath: ImageConstant.imgImage199,
                    height: 214.h,
                    width: 350.w,
                    radius: BorderRadius.circular(
                      10.w,
                    ),
                  );
                })));
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
        title: AppbarSubtitleSeven(
            text: "Our Other Products",
            margin: EdgeInsets.only(left: 22.h)));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }
}
