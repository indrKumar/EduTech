import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../utils/image_constant.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_seven.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_image_view.dart';

class BlogDetailsPage extends StatefulWidget {
  const BlogDetailsPage({super.key});

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: _buildAppBar(),
      body:  SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 32.h),
          child: Container(
            margin: EdgeInsets.only(bottom: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 1.w,
                    right: 11.w,
                  ),
                  child: const Text(
                    "Is It Safe to Fly During Pandemic?",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 21.h),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: const Text(
                    "Category Name  ·  Nov. 25, 2020",
                    // style: CustomTextStyles.bodyMediumInter,
                  ),
                ),
                SizedBox(height: 21.h),
                CustomImageView(
                  imagePath: ImageConstant.imgImagePlaceholder,
                  margin: EdgeInsets.only(left: 1.w),
                ),
                SizedBox(height: 25.h),
                Container(
                  width: 348.w,
                  margin: EdgeInsets.only(left: 1.w),
                  child: Text(
                    "A day after the Centers for Disease Control and Prevention urged Americans to stay home for Thanksgiving, more than one million people in the United States got on planes, marking the second day that more than a million people have flown since March. Nearly three million additional people have flown in the days since.",
                    maxLines: 14,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeInter.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Text(
                    "But filtration is not enough.",
                    style: CustomTextStyles.titleMediumInter,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 349.w,
                  margin: EdgeInsets.only(left: 1.w),
                  child: Text(
                    "sVentilation is just one piece of the puzzle, said Saskia Popescu, an infection prevention epidemiologist in Arizona. (Dr. Popescu is married to Mr. Popescu.) Distancing and masking are also important to mitigate risk, and are the other key components for keeping the coronavirus from spreading, whether on planes or elsewhere.",
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyLargeInter.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
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
            text: "Blogs", margin: EdgeInsets.only(left: 22.w)));
  }

  void onTapArrowLeft() {
    Get.back();
  }
}