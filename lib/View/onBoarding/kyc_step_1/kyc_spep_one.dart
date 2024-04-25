import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../controllers/kyc_one/kyc_controller_one.dart';
import '../../../controllers/usertyep_controller.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/delete_popup_sheet.dart';
import '../kyc_2/edu_qualification_list.dart';
import '../kyc_3/add_teaching_locations.dart';
import 'category_list.dart';

class Kyc_Step_One_Screen extends StatefulWidget {
  const Kyc_Step_One_Screen({Key? key}) : super(key: key);

  @override
  State<Kyc_Step_One_Screen> createState() => _Kyc_Step_One_ScreenState();
}

class _Kyc_Step_One_ScreenState extends State<Kyc_Step_One_Screen> {
  final KycControllerOne kycOneController = Get.put(KycControllerOne());
  EducationController educationController = Get.put(EducationController());
  final UserTypeController userTypeController = Get.put(UserTypeController());

  @override
  void initState() {
    super.initState();
    // Call the fetchDataAndSave method when the screen initializes
    kycOneController.fetchKycStatus();
  }

  @override
  Widget build(BuildContext context) {
    print("ISSSSSSSSS${userTypeController.isTeacher.value}");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 19.w,
            vertical: 119.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgkyc1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 55.w),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Complete the following steps to ",
                          style: CustomTextStyles.titleMediumff000000SemiBold,
                        ),
                        TextSpan(
                          text: "start getting leads",
                          style: CustomTextStyles.titleMediumff00c1ff,
                        ),
                        TextSpan(
                          text: " updates ",
                          style: CustomTextStyles.titleMediumff000000SemiBold,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 35.h),
                Obx(() => customStep(
                      title: "Teaching Preferences",
                      isComplete:
                          kycOneController.teachingPreferences.value,
                      onTap: () {
                        print(kycOneController.teachingPreferences.value);
                        if (!kycOneController.teachingPreferences.value) {
                          Get.to(const CategoriesListScreen())?.then((value) {
                            kycOneController.fetchKycStatus();
                          });
                        } else {}
                      },
                    )),
                SizedBox(height: 15.h),
                Obx(() => customStep(
                      isComplete:
                          kycOneController.educationalQualifications.value,
                      title: "Educational Qualifications",
                      isStart: kycOneController.teachingPreferences.value
                          ? false
                          : true,
                      onTap: () {
                        print(kycOneController.educationalQualifications.value);
                        if (kycOneController.teachingPreferences.value== true && kycOneController.educationalQualifications.value == false) {
                          Get.to(const EduQualificationList())?.then((value) {
                            kycOneController.fetchKycStatus();
                          });
                        } else {}
                      },
                    )),
                SizedBox(height: 15.h),
                Obx(() => customStep(
                    isComplete: kycOneController.locationPreferences.value,
                    title: "Location Preferences",
                    isStart: kycOneController.educationalQualifications.value
                        ? false
                        : true,
                    onTap: () {
                      print(kycOneController.locationPreferences.value);
                      if (kycOneController.educationalQualifications.value &&  kycOneController.locationPreferences.value == false) {
                        Get.to(const TeachingLocationsScreen())?.then((value) {
                          kycOneController.fetchKycStatus();
                        });
                      } else {}
                    })),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildSubmitForReviewButton(),
    );
  }

  Widget customStep({
    required String title,
    bool isComplete = false,
    bool isStart = false,
    void Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: 6.w,
        right: 5.w,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(
              color:
                  isComplete == false ? Colors.grey : theme.colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    8.h.horizontalSpace,
                    Text(
                      title.toString(),
                      style: isStart == false
                          ? const TextStyle(fontWeight: FontWeight.w700)
                          : TextStyle(color: Colors.grey.shade400),
                    ),
                  ],
                ),
                isComplete
                    ? Container(
                        padding: EdgeInsets.all(5.h),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(14.w),
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark8,
                          color: Colors.white,
                          height: 18,
                          width: 18,
                        ),
                      )
                    : const Text("Start")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitForReviewButton() {
    return Obx(
      () =>  CustomElevatedButton(
        onPressed: () {
          if (kycOneController.educationalQualifications.value == true &&
              kycOneController.locationPreferences.value == true&&
              kycOneController.teachingPreferences.value == true) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return customDeletePopup(
                  onTap: () {
                    // educationController.submitKycStatus(id: 4).then((value) {
                    //   print(value);
                    // });
                    Get.offAll(()=> const Kyc_Step_Four_Vidio());
                  },
                  context,
                  title2: "Thank You!",
                  submit: "Okay",
                  subtitle:
                  "Your details has been submitted for review. Our team will get back to you soon.",
                );
              },
            );
          }else{
           Fluttertoast.showToast(msg: "Please follow all these steps");

          }
        },
        text: "Submit for Review",
        margin: EdgeInsets.only(
          left: 16.w,
          right: 24.w,
          bottom: 35.h,
        ),
        decoration:kycOneController.educationalQualifications.value &&
            kycOneController.locationPreferences.value &&
            kycOneController.teachingPreferences.value ? CustomButtonStyles.gradientPrimaryToBlueDecoration : CustomButtonStyles.gradientPrimaryToBlueTL23Decoration,
      ),
    );
  }

}
