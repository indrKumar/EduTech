import 'dart:convert';
import 'package:edushalaacademy/View/onBoarding/kyc_4/experience_list.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/instruction_for_video.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/notifyscreen.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/personal_info.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/qualified.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/virtual_interview_link_page.dart';
import 'package:edushalaacademy/controllers/kyc2_controllers/kyc_status_controller.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/delete_popup_sheet.dart';
import 'package:http/http.dart' as http;
class Kyc_Step_Four_Vidio extends StatefulWidget {
  const Kyc_Step_Four_Vidio({super.key});

  @override
  State<Kyc_Step_Four_Vidio> createState() => _Kyc_Step_Four_VidioState();
}

class _Kyc_Step_Four_VidioState extends State<Kyc_Step_Four_Vidio> {
  final Kyc2StatusController kycOneController = Get.put(Kyc2StatusController());

  Future<void> get() async {
    await kycOneController.fetchKycStatus();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    // Call the get method when the screen initializes
    get();
  }

  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPref.SP_KEY_REFRESH_TOKEN) ?? '';
  }

  @override
  Widget build(BuildContext context) {
    print(SharedPref.accessToken);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 11.h,
            vertical: 119.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomImageView(
                  imagePath: ImageConstant.imgkyc1,
                  // height: 18,
                  // width: 18,
                ),
              ),
              Container(
                // width: 296.h,
                margin: EdgeInsets.only(right: 55.h, left: 10),
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
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 15.w),
              Obx(() =>
                  customStep(
                    title: "Personal Information",
                    isComplete: kycOneController.personalInformation.value,
                    onTap: () {
                      print(kycOneController.personalInformation.value);
                      if (!kycOneController.personalInformation.value) {
                        Get.to(const PersonalInformation());
                      } else {}
                    },
                  )),
              SizedBox(height: 15.w),
              Obx(() =>
                  customStep(
                    isComplete: kycOneController.teachingExperience.value,
                    title: "Teaching Experiences",
                    isStart:
                    // kycOneController.appliedList.last.status||
                    kycOneController.personalInformation.value
                        ? false
                        : true,
                    onTap: () {
                      print(kycOneController.teachingExperience.value);
                      if (kycOneController.personalInformation.value) {
                        if (!kycOneController.teachingExperience.value) {
                          Get.to(const ExperiencesListScreen())!.then((value) {
                            get();
                          });
                        } else {}
                      } else {}
                    },
                  )),
              // kycOneController.appliedList != null ? SizedBox(height: 15.w):const SizedBox(),
              if (kycOneController.appliedList.isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: kycOneController.appliedList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Obx(() =>
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.w),
                          child: customStep(
                            title: kycOneController.appliedList[index].name
                                .toString(),
                            isComplete:
                            kycOneController.appliedList[index].status
                                ? true
                                : false,
                            isStart: kycOneController.appliedList[index].status
                                ? false
                                : true,
                            onTap: () {
                              // print(index + 1)
                              print(kycOneController.appliedList[index].status);
                              if (kycOneController.appliedList[index].status ||
                                  kycOneController.teachingExperience.value) {
                                Get.to(InstructionForVideoVar(
                                  index: index + 1,
                                  id: kycOneController.appliedList[index].id,
                                ));
                              } else {

                              }
                            },
                          ),
                        ));
                  },
                ),

              // SizedBox(height: 7.5.h),
              // SizedBox(height: 15.w),
              Obx(() =>
                  customStep(
                    isComplete: kycOneController.virtualInterview.value,
                    title: "Virtual Interview",
                    isStart: kycOneController.appliedList.isNotEmpty && kycOneController.personalInformation.value
                        ? !kycOneController.appliedList.last.status
                        : true,
                    onTap: () {
                      print(kycOneController.virtualInterview.value);
                        Get.to(Notify_Screen());
                        Get.to(const VirtualInterviewScreen());
                    },
                  )),

              SizedBox(height: 15.w),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildSubmitForReviewButton(),
    );
  }

  Widget customStep({String? title,
    bool isComplete = false,
    isStart = false,
    void Function()? onTap}) {
    return Padding(
        padding: EdgeInsets.only(
          left: 6.h,
          right: 5.h,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                border: Border.all(
                  color: isComplete == false
                      ? Colors.grey
                      : theme.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(22)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Wrap(
                      children: [
                        8.h.horizontalSpace,
                        Text(title.toString(),
                            style: isStart == false
                                ? const TextStyle(
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis)
                                : TextStyle(
                                color: Colors.grey.shade400,
                                overflow: TextOverflow.ellipsis))
                      ],
                    ),
                  ),
                  isComplete
                      ? Container(
                    padding: EdgeInsets.all(5.h),
                    // margin: EdgeInsets.fromLTRB(30.h, 7.w, 21.h, 7.w),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                        14.h,
                      ),
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
        ));
  }

  /// Section Widget
  Widget _buildSubmitForReviewButton() {
    return Obx(
          () => kycOneController.appliedList.isNotEmpty
          ? CustomElevatedButton(
        onPressed: () {
          if (kycOneController.appliedList.last.status &&
              kycOneController.teachingExperience.value &&
              kycOneController.personalInformation.value &&
              kycOneController.virtualInterview.value) {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return customDeletePopup(
                  context,
                  title2: "Thank You!",
                  submit: "Okay",
                  subtitle:
                  "Your details have been submitted for review. Our team will get back to you.",
                  onTap: () {
                    Get.offAll(() => const QualifiedScreen());
                  },
                );
              },
            );
          } else {
            Fluttertoast.showToast(msg: 'Please complete all steps first');
          }

        },
        text: "Submit for Review",
        margin: EdgeInsets.only(left: 11.h, right: 11.h, bottom: 35.w),
        decoration: kycOneController.appliedList.isNotEmpty &&
            kycOneController.appliedList.last.status &&
            kycOneController.teachingExperience.value &&
            kycOneController.personalInformation.value &&
            kycOneController.virtualInterview.value
            ? CustomButtonStyles.gradientBlueToIndigoDecoration
            : CustomButtonStyles.gradientPrimaryToBlueTL23Decoration,
      )
          : Container(), // Handle the case when the list is empty
    );

  }
}
