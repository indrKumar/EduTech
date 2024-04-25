import 'package:edushalaacademy/View/onBoarding/kyc_step_1/kyc_spep_one.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_step_1/select_cat.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/View/widgets/delete_popup_sheet.dart';
import 'package:edushalaacademy/controllers/manage_screen_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/kyc_one/kyc_controller_one.dart';
import '../../../models/teaching_pref_list.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  final KycControllerOne kycController = Get.put(KycControllerOne());
MyController myController = Get.put(MyController());
  @override
  void initState() {
    super.initState();
    kycController.fetchTeachingPreferences();
  }

  @override
  Widget build(BuildContext context) {
    kycController.fetchTeachingPreferences();
    print(kycController.teachingPreferencesList.length);
    print("YTEEEEDEE${kycController.teachingPreferencesList}");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          // alignment: Alignment.bottomCenter,
          children: [
            70.h.verticalSpace,
            Align(
              alignment: Alignment.center,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    color: theme.primaryColor,
                    child: Container(
                      height: 7,
                      // decoration: BoxDecoration(color:theme.primaryColor),
                    ),
                  ),
                  // LinearProgressIndicator(
                  //   value: 0.25, // Adjust the value based on the progress of step three
                  // ),
                  SizedBox(height: 3.h),
                  CustomImageView(
                    imagePath: ImageConstant.imgGroup46538,
                    height: 1.h,
                    width: 349.w,
                  ),
                  SizedBox(height: 23.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: CustomTextStyles.titleMediumBlack900Bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "You can choose one category at a time. If you want to choose more than one then complete the stages of first category",
                      style: CustomTextStyles.titleSmallBlack90015,
                    ),
                  ),
                  // SizedBox(height: 19.w),
                  // _buildViewHierarchySection(),
                  Obx(() {
                    if (kycController.teachingPreferencesList.length < 0) {
                      return const Center(child: Text(""));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: kycController.teachingPreferencesList.length,
                        itemBuilder: (context, index) {
                          TeachingPreference preference =
                              kycController.teachingPreferencesList[index];
                          return catInfoCard(
                              title: preference.title,
                              data: preference.catdata,
                              index:index,
                              // preference.academic,
                              // preference.classLevel,
                              // preference.board,
                              // preference.subjects?.join(", "),
                              id: preference.id);
                        },
                      );
                    }
                  }),
                  SizedBox(height: 28.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                          // MainScreen()
                          SelectCategory(isParent: false,))?.then((value) {
                        kycController.fetchTeachingPreferences();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          color: Colors.black,
                          imagePath: ImageConstant.imgAdd1,
                          height: 24,
                          width: 24,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 6.w,
                            top: 3.h,
                          ),
                          child: Text(
                            "Add New Category",
                            style: CustomTextStyles.titleMediumBlack900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
            // _buildTodayScheduleSection(),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => Padding(
          padding: const EdgeInsets.only(left: 30),
          child: myController.isIndicatorVisible.value?Center(child: MyCircularProgressIndicator(),):CustomElevatedButton(
            onPressed: () {
              if (kycController.teachingPreferencesList.length > 0) {
                myController.showCircularProgress();
                kycController.submitKyc(1).then((value) {
                  if (value != null) {
                    if (value['is_error'] == false) {
                      Get.offAll(const Kyc_Step_One_Screen());
                      Fluttertoast.showToast(msg: "Submitted");
                      myController.hideCircularProgress();
                    } else {
                      Fluttertoast.showToast(msg: "Something went wrong");
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                  }
                  print(value);
                });
              } else {
                Fluttertoast.showToast(msg: "Please add category first!");
              }
            },
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            // buttonStyle: CustomButtonStyles.none,
            text: "Submit",
          ),
        ),
      ),
    );
  }

  Widget catInfoCard({title,required List<Map<String, String>> data, id,index}) {
    return Card(
      color: const Color(0xFFF9F9FA),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toString(),
                  style: CustomTextStyles.labelLargeBlack900Bold_3,
                ),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: data.length * 2 - 1, // Adjust the item count to include separators
                    itemBuilder: (context, index) {
                      if (index.isOdd) {
                        return const Text(' | ',style: TextStyle(fontSize: 10),); // Display separator
                      } else {
                        return Text(
                          data[index ~/ 2]["name"].toString(), // Get the name from the data list
                          style: const TextStyle(fontSize: 10, fontFamily: "Montserrat"),
                        );
                      }
                    },
                  ),
                )

              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return customDeletePopup(context, onTap: () {
                      kycController.deleteCat(id: id).then((value) {
                        
                        if (value != null) {
                          if (value["is_error"] == false) {
                            Get.back();
                          }
                        }
                        if (kDebugMode) {
                          print("RAM $value");
                        }
                      });
                    },
                        title1: "Are you",
                        title2: "sure?",
                        subtitle:
                            "Once it is deleted, you can’t retrieve the deleted data.",
                        submit: "Confirm");
                  },
                ).then((value) {
                  kycController.fetchTeachingPreferences();
                });
              },
              child: CustomImageView(
                  width: 22,
                  height: 22,
                  imagePath: ImageConstant.imgDelete1,
                  color: theme.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
