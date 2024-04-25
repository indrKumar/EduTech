import 'dart:async';

import 'package:edushalaacademy/View/onBoarding/kyc_2/add_edit_qualification.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/View/widgets/delete_popup_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../kyc_step_1/kyc_spep_one.dart';

class EduQualificationList extends StatefulWidget {
  const EduQualificationList({super.key});

  @override
  State<EduQualificationList> createState() => _EduQualificationListState();
}

class _EduQualificationListState extends State<EduQualificationList> {
  EducationController educationController = Get.put(EducationController());
bool isloading = false;
  Future get() async {
    setState(() {
      isloading = true;
    });
       await educationController.educationList().then((value) {
         setState(() {
           isloading = false;
         });
       });
  }
  final MyController myController = Get.put(MyController());


  @override
  void initState() {
    get().then((value) {

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Educational ",
                    style: CustomTextStyles.titleMediumcc000000,
                  ),
                  TextSpan(
                    text: "Qualifications",
                    style: CustomTextStyles.titleMediumff00c1ffBold,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 15),
            Container(
              margin: EdgeInsets.only(right: 24.w),
              child: Text(
                "You can choose one category at a time. If you want to choose more than one category, first complete the details of one selected category. ",
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 24.h),
            // _buildViewHierarchy(),
            isloading ? const Center(child: CircularProgressIndicator()) : Expanded(
              child: ListView.builder(
                itemCount: educationController.eduQualifications.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = educationController.eduQualifications[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: qualificationsList(context,
                        percentage: data.percentage,
                        medium: data.medium,
                        classT: data.name,
                    id: data.id
                    ),
                  );
                },
              ),
            ),
            24.h.verticalSpace,
            GestureDetector(
              onTap: () {
                Get.to(AddEditQualifications(isEdit: false,))?.then((value) {
                  get();
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAdd1,
                    height: 24.h,
                    width: 24.w,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 6.w,
                      top: 3.h,
                    ),
                    child: Text(
                      "Add New Qualification",
                      style: CustomTextStyles.titleMediumBlack900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: myController.isIndicatorVisible.value?SizedBox(height:30,child: Center(child: MyCircularProgressIndicator(),),):CustomElevatedButton(
            onPressed: () {
              if(educationController.eduQualifications.length > 0) {
                myController.showCircularProgress();
                educationController.submitKycStatus(id: 2).then((value) {
                Get.offAll(const Kyc_Step_One_Screen());
                Fluttertoast.showToast(msg: "Submitted");
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  myController.hideCircularProgress();
                });

                print(value);
              });
              }else{
                Fluttertoast.showToast(msg: "Please add qualification first!");
              }
            },
            text: "Submit",
            // buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget qualificationsList(
    BuildContext context, {
    classT,
    medium,
    percentage,
        id
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 5.h,
      ),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.h,
              bottom: 5.w,
            ),
            child: CustomIconButton(
              height: 59.h,
              width: 59.w,
              padding: EdgeInsets.all(11.h),
              decoration: IconButtonStyleHelper.fillPrimary,
              child: CustomImageView(
                color: Colors.white,
                imagePath: ImageConstant.imgLightBulbPrimarycontainer,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 17.w,
              top: 12.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classT ?? '',
                  style: CustomTextStyles.labelLargeBlack900Bold_3,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Medium: ",
                        style: theme.textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: "${medium ?? ''}\n",
                        style: CustomTextStyles.bodySmallff00000010,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Percentage/Grade: ",
                    style: theme.textTheme.labelMedium,
                  ),
                  TextSpan(
                    text: "${percentage ?? '0'}%",
                    style: CustomTextStyles.bodySmallff00000010,
                  ),
                ]))
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            onTap: () {
              Get.to(()=> AddEditQualifications(id: id.toString(),isEdit: true,));
            },
            imagePath: ImageConstant.imgEdit1,
            height: 17.h,
            width: 17.w,
            color: theme.primaryColor,
            margin: EdgeInsets.only(
              top: 14.h,
              bottom: 40.h,
            ),
          ),
          CustomImageView(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return customDeletePopup(context,
                      onTap: () {
                    print(id);
                        educationController.deleteEducation(id: id).then((value) {
                          if(value != null){
                            if(value["is_error"]==false){
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
                educationController.educationList();

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
    );
  }
}
