import 'package:edushalaacademy/View/auth/loging_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/kyc_one/overview_three_controller.dart';
import '../../controllers/usertyep_controller.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';

class OverviewThreeOneScreen extends GetWidget<OverviewThreeController> {
  OverviewThreeOneScreen({Key? key}) : super(key: key);
  final UserTypeController userTypeController = Get.put(UserTypeController());

  @override
  Widget build(BuildContext context) {
    print("ISSSSSSSSS${userTypeController.isTeacher.value}");
    final OverviewThreeController controller =
        Get.put(OverviewThreeController());
    List<Widget> pages = [fistPage(), fistPage(), thirdPage()];

    return Scaffold(
      body: Center(
        child: SizedBox(
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: pages.length,
            onPageChanged: (value) {
              controller.changePage(value);
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  pages[index],
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome to ",
                      style: CustomTextStyles.titleMediumcc14020216,
                    ),
                    TextSpan(
                      text: "EDU",
                      style: CustomTextStyles.titleMediumff264588,
                    ),
                    const TextSpan(
                      text: " ",
                    ),
                    TextSpan(
                      text: "SHALA!",
                      style: CustomTextStyles.titleMediumff00c1ffBold,
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 25.h),
            CustomElevatedButton(
              onPressed: () {
                if (controller.currentPage < pages.length - 1) {
                  controller.goToPage(controller.currentPage + 1);
                } else {
                  Get.to(() => LoginMobileScreen(
                        type: "teacher",
                      ));
                }
              },
              text: "Next",
              buttonTextStyle: CustomTextStyles.titleMediumPrimaryContainer_3,
            ),
            SizedBox(height: 25.h),
            Text(
              "100% Free & Secure",
              style: CustomTextStyles.bodyMediumMontserratGray600cc,
            ),
          ],
        ),
      ),
    );
  }

  Widget fistPage() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 113.h),
            CustomImageView(
              imagePath: ImageConstant.overView1st,
            ),
            SizedBox(height: 48.h),
            60.h.verticalSpace,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Find your",
                    style: CustomTextStyles.bodyLargeff000000,
                  ),
                  TextSpan(
                    text: " favorite subject or activity",
                    style: CustomTextStyles.titleMediumff000000Bold,
                  ),
                  TextSpan(
                    text: " to teach",
                    style: CustomTextStyles.bodyLargeff000000,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 53.h),
          ],
        ),
      ),
    );
  }

  List<dynamic> secondPageContent = [
    {
      "name": "Ankit Kumar",
      "travel": "Can travel upto 10km",
      "location": "C-121, central park, vijay nagar, Bhopal"
    },
    {
      "name": "Ankit Kumar",
      "travel": "Can travel upto 10km",
      "location": "C-121, central park, vijay nagar, Bhopal"
    },
    {
      "name": "Ankit Kumar",
      "travel": "Can travel upto 10km",
      "location": "C-121, central park, vijay nagar, Bhopal"
    },
  ];

  Widget secondPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 102.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: secondPageContent.length,
            itemBuilder: (context, index) => Align(
              alignment: secondPageContent[index] == index
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      secondPageContent[index]["name"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0XFF00C1FF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    6.h.verticalSpace,
                    Text(
                      secondPageContent[index]["travel"],
                      style: CustomTextStyles.bodySmallBlack90010,
                    ),
                    10.h.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(secondPageContent[index]["location"],
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          100.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Spot a learner near you and",
                    style: CustomTextStyles.bodyLargeff000000,
                  ),
                  TextSpan(
                    text: " get started",
                    style: CustomTextStyles.titleMediumff000000Bold,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 43.h),
        ],
      ),
    );
  }

  Widget thirdPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 132.h),
          CustomImageView(
            imagePath: ImageConstant.imgImgg11,
          ),
          180.h.verticalSpace,
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Why Edushala?",
                  style: CustomTextStyles.titleLargeff000000,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 43.h),
        ],
      ),
    );
  }
}
