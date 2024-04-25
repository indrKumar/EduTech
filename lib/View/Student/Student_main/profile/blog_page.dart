import 'package:edushalaacademy/View/Student/Student_main/profile/blog_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../theme/custom_text_style.dart';
import '../../../../theme/theme_helper.dart';
import '../../../../utils/image_constant.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_subtitle_seven.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_image_view.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.5.h),
                  child: SizedBox(
                      child: Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: appTheme.black900.withOpacity(0.56))));
            },
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    Get.to(()=>const BlogDetailsPage());
                  },
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 11.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(
                                    "PM Modi to flag off Bhopal-Delhi Vande Bharat Express today. Check route, timing",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles.titleSmallInterBlack900
                                        .copyWith(
                                      height: 1.55,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Row(children: [
                                  Text(
                                    "News  -  ",
                                    style: CustomTextStyles.bodySmallInterPrimary,
                                  ),
                                  Text(
                                    "1 hour ago",
                                    style: CustomTextStyles.bodySmallInterPrimary,
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgRectangle4188,
                          height: 63.h,
                          radius: BorderRadius.circular(
                            3.h,
                          ),
                          margin: EdgeInsets.only(bottom: 36.h),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
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
