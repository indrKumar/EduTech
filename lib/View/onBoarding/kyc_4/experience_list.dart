import 'dart:async';

import 'package:edushalaacademy/View/onBoarding/kyc_4/add_new_teaching_ex.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/controllers/kyc2_controllers/teaching_ex_controller.dart';
import 'package:edushalaacademy/controllers/manage_screen_controller.dart';
import 'package:edushalaacademy/models/experience_list_modele.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/delete_popup_sheet.dart';

class ExperiencesListScreen extends StatefulWidget {
  const ExperiencesListScreen({super.key});

  @override
  State<ExperiencesListScreen> createState() => _ExperiencesListScreenState();
}

class _ExperiencesListScreenState extends State<ExperiencesListScreen> {
  TeachingEx_Controller educationController = Get.put(TeachingEx_Controller());
  EducationController educationControllerNotT = Get.put(EducationController());
MyController myController = Get.put(MyController());
  Future get() async {
    await educationController.experienceList();
  }

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(SharedPref.accessToken);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 11.h,
                  vertical: 42.w,
                ),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder22,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.h.verticalSpace,
                    Text(
                      "Teaching Experiences",
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                    SizedBox(height: 9.w),
                    Container(
                      margin: EdgeInsets.only(right: 24.h),
                      child: Text(
                        "When adding your work experience, please provide details for one job specification at a time. ",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    // SizedBox(height: 22.w),
                    // _buildScheduleComponent(),
                    Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: educationController.experienceData.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            child: lists(context,
                                data:
                                    educationController.experienceData[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.w),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => AddNewTeachingExperience(
                                isEdit: false,
                              ))?.then((value) {
                            get();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgAdd1,
                              height: 24.w,
                              width: 24.h,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 6.h,
                                top: 3.w,
                              ),
                              child: Text(
                                "Add New Qualification",
                                style: CustomTextStyles.titleMediumBlack900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 266.w),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Continue if you don’t have any experience.",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 17.w),
              Obx(
                () => myController.isIndicatorVisible.value ? SizedBox(height: 30,child: Center(child: MyCircularProgressIndicator(),),):CustomElevatedButton(
                  onPressed: () {
                    if (educationController.experienceData.length > 0) {
                      myController.showCircularProgress();
                      educationControllerNotT
                          .submitKycStatus(id: 4)
                          .then((value) {
                        Fluttertoast.showToast(msg: "Submitted Successfully");
                        Get.offAll(const Kyc_Step_Four_Vidio());
                        myController.hideCircularProgress();
                      });
                    } else {
                      Fluttertoast.showToast(msg: "Please add experience first");
                      Future.delayed(Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                    // educationController.finalSubmitExperience(id: 4);
                  },
                  text: "Submit",
                  // buttonStyle: CustomButtonStyles.none,
                  decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
                ),
              ),
            ],
          ),
        )
        // _buildBottomBar(),
        );
  }


  Widget lists(BuildContext context, {required ExperienceList data}) {
    return SizedBox(
      height: 83.w,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGroup46412,
            height: 1.w,
            width: 112.h,
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 24.w),
          ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 5.w),
          //     child: Text(
          //       // data.designation.toString(),
          //       "Maths Teacher",
          //       // schedulecomponentItemModelObj.scheduleText!.value,
          //       style: CustomTextStyles.titleMediumBold,
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 14.h,
                vertical: 4.w,
              ),
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 59.h,
                    width: 59.h,
                    margin: EdgeInsets.only(
                      top: 8.w,
                      bottom: 6.w,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                        29.h,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 17.h,
                      top: 13.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.designation.toString(),
                          // "Maths Teacher",
                          style: CustomTextStyles.labelLargeBlack900Bold_3,
                        ),
                        SizedBox(height: 1.w),
                        if(data.type != "Teaching") SizedBox(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Tenure : ",
                                  style: theme.textTheme.labelMedium,
                                ),
                                TextSpan(
                                  text: data.startYear ?? "",
                                  style: CustomTextStyles.bodySmallff00000010,
                                ),
                                TextSpan(
                                  text: " - ",
                                  style: CustomTextStyles.bodySmallff00000010,
                                ),
                                TextSpan(
                                  text: data.endYear ?? "",
                                  style: CustomTextStyles.bodySmallff00000010,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        5.h.verticalSpace,
                        if(data.type == "Teaching") RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Subjects : ",
                                style: theme.textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: data.subjects??"",
                                style: CustomTextStyles.bodySmallff00000010,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomImageView(
                    onTap: () {
                      Get.to(() => AddNewTeachingExperience(
                            isEdit: true,
                            id: data.id,
                          ))?.then((value) {
                        get();
                      });
                    },
                    imagePath: ImageConstant.imgEdit1,
                    height: 20.w,
                    width: 17.h,
                    color: theme.primaryColor,
                    margin: EdgeInsets.only(
                      top: 13.w,
                      bottom: 41.w,
                    ),
                  ),
                  CustomImageView(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return customDeletePopup(context, onTap: () {
                            print(data.id);
                            print(SharedPref.accessToken);
                            educationController
                                .deleteExperience(id: data.id)
                                .then((value) {
                              if (value != null) {
                                if (value["is_error"] == false) {
                                  Fluttertoast.showToast(
                                      msg: "Deleted Successfully");
                                  Get.back();
                                }
                              }
                              print("RAM ${value}");
                            });
                          },
                              title1: "Are you",
                              title2: "sure?",
                              subtitle:
                                  "Once it is deleted, you can’t retrieve the deleted data.",
                              submit: "Confirm");
                        },
                      ).then((value) {
                        get();
                      });
                    },
                    color: theme.primaryColor,
                    imagePath: ImageConstant.imgDelete1,
                    height: 22.h,
                    width: 22.w,
                    margin: EdgeInsets.fromLTRB(10.w, 12.h, 2.w, 37.h),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
