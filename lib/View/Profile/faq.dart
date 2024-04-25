import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/app_bar/appbar_subtitle_nine.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<dynamic> listOfFaq = [
    {
      "title": "Is there a free trial available?",
      "subtitle": "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible."
    },
    {
      "title": "Can I change my plan later?",
      "subtitle": "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible."
    },
    {
      "title": "What is your cancellation policy?",
      "subtitle": "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible."
    },
    {
      "title": "Can other info be added to an invoice?",
      "subtitle": "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible."
    },
    {
      "title": "How does billing work?",
      "subtitle": "Yes, you can try us for free for 30 days. If you want, we’ll provide you with a free, personalized 30-minute onboarding call to get you up and running as soon as possible."
    },
  ];

  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.filled(listOfFaq.length, false);
  }

  void _toggleExpanded(int index) {
    setState(() {
      _isExpandedList[index] = !_isExpandedList[index];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 3.h),
          child: Container(
            margin: EdgeInsets.only(bottom: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 46.w,
                    right: 47.w,
                  ),
                  child: Text(
                    "Frequently asked questions",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      height: 1.27,
                    ),
                  ),
                ),
                SizedBox(height: 13.h),
                Container(
                  margin: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: Text(
                    "Everything you need to know about the product and billing.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style:
                    CustomTextStyles.bodyLargeInterBluegray50018.copyWith(
                      height: 1.56,
                    ),
                  ),
                ),
                50.h.verticalSpace,
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listOfFaq.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      // left: 11.w,
                      bottom: 80.h,
                    ),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listOfFaq[index]["title"].toString(),
                                    style: CustomTextStyles.titleMediumInterGray90001,
                                  ),
                                  if (_isExpandedList[index])  SizedBox(height: 12.h),
                                  if (_isExpandedList[index]) SizedBox(
                                    child: Text(

                        listOfFaq[index]["subtitle"].toString(),
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: CustomTextStyles.bodyLargeInterBluegray500.copyWith(
                                        height: 1.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomIconButton(
                            onTap: ()=>_toggleExpanded(index),
                            height: 26.h,
                            width: 24.w,
                            child: SvgPicture.asset(
                     _isExpandedList[index]?ImageConstant.imgMinusCircle:ImageConstant.imgPlusCircle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },),
                _buildContent6(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AppbarSubtitleNine(
          text: "FAQ’s",
          margin: EdgeInsets.only(left: 20.w),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildContent6() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 31.w,
        vertical: 32.h,
      ),
      decoration: AppDecoration.fillPrimary3.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 56.h,
            width: 120.w,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgAvatar,
                  height: 48.h,
                  width: 48.w,
                  radius: BorderRadius.circular(
                    24.w,
                  ),
                  alignment: Alignment.bottomLeft,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgAvatar48x48,
                  height: 48.h,
                  width: 48.w,
                  radius: BorderRadius.circular(
                    24.w,
                  ),
                  alignment: Alignment.bottomRight,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgAvatar56x56,
                  height: 56.h,
                  width: 56.w,
                  radius: BorderRadius.circular(
                    28.w,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 27.h),
          Text(
            "Still have questions?",
            style: CustomTextStyles.titleLargeInterGray90001,
          ),
          SizedBox(height: 10.h),
          SizedBox(
            child: Text(
              "Can’t find the answer you’re looking for? Please chat to our friendly team.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeInterBluegray500.copyWith(
                height: 1.50,
              ),
            ),
          ),
          SizedBox(height: 22.h),
          CustomElevatedButton(
            text: "Get in touch",
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
          ),
        ],
      ),
    );
  }

}
