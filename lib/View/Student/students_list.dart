import 'package:edushalaacademy/View/Student/tutor_nearyou_screen.dart';
import 'package:edushalaacademy/controllers/StudentController/basicdetails_controller.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../onBoarding/kyc_step_1/select_cat.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/delete_popup_sheet.dart';

class StudentsLists extends StatefulWidget {
  const StudentsLists({super.key});

  @override
  State<StudentsLists> createState() => _StudentsListsState();
}

class _StudentsListsState extends State<StudentsLists> {
  final BasicDetailsController _controller = Get.put(BasicDetailsController());
  var studentList = [];
  var subjects = [];

  get() async {
    await _controller.fetchStudentList().then((value) {
      if (value != null) {
        if (value["is_error"] == false) {
          setState(() {
            studentList = value?["students"];
            // subjects = value[""]
          });
          print("VAOLALLALLAL$studentList");
        } else {
          print("data not fount");
        }
      }
    });
  }

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(studentList.length > 1);
    // get();
    // _controller.fetchStudentList();
    print(SharedPref.accessToken);

    // print(_controller.studentModels);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: studentList.length > 0
          ? SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        40.h.verticalSpace,
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Student  ",
                                  style:
                                      CustomTextStyles.titleMediumcc000000Bold),
                              TextSpan(
                                  text: "List",
                                  style: CustomTextStyles
                                      .titleMediumff00c1ffBold_1)
                            ]),
                            textAlign: TextAlign.left),
                        const SizedBox(height: 8),
                        Container(
                            margin: const EdgeInsets.only(right: 23),
                            child: Text(
                                "You can choose one category at a time. If you want to choose more than one category, first complete the details of one selected category. ",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.labelLarge)),
                        ListView.builder(
                          itemCount: studentList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 5,
                                ),
                                decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder10,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Padding(
                                    //   padding: EdgeInsets.only(
                                    //     top: 7,
                                    //     bottom: 5,
                                    //   ),
                                    //   child: CustomIconButton(
                                    //     height: 59,
                                    //     width: 59,
                                    //     padding: EdgeInsets.all(10.h),
                                    //     decoration: IconButtonStyleHelper
                                    //         .fillLightBlueATL29,
                                    //     child: CustomImageView(
                                    //       color: Colors.white,
                                    //       imagePath:
                                    //           ImageConstant.imgCheckmark8Gray300,
                                    //     ),
                                    //   ),
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 17,
                                        top: 13,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            studentList[index]["name"] ?? '',
                                            style: CustomTextStyles
                                                .labelLargeBlack900Bold_3,
                                          ),
                                          SizedBox(
                                              height: 20,
                                              // width: 150,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: studentList[index]
                                                        ["catdata"]
                                                    .length,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (context, itemIndex) {
                                                  // Assuming the subjects are strings
                                                  String subject =
                                                      studentList[index]
                                                              ["catdata"]
                                                          [itemIndex]['name'];
                                                  // Check if it's the first item to avoid adding a comma before the first subject
                                                  if (itemIndex == 0) {
                                                    return Text(subject,
                                                        style: CustomTextStyles
                                                            .bodySmallff00000010);
                                                  } else {
                                                    return Text(" | $subject",
                                                        style: CustomTextStyles
                                                            .bodySmallff00000010);
                                                  }
                                                },
                                              )),
                                          // RichText(
                                          //   text: TextSpan(
                                          //     children: [
                                          //       TextSpan(
                                          //         text: "Board: ",
                                          //         style: CustomTextStyles
                                          //             .labelMediumff000000,
                                          //       ),
                                          //       TextSpan(
                                          //         text: "State Board",
                                          //         style: CustomTextStyles
                                          //             .bodySmallff00000010,
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   textAlign: TextAlign.left,
                                          // ),
                                          // Row(children: [
                                          // Text("Subject : ",  style: CustomTextStyles
                                          //     .labelMediumff000000,),
                                          SizedBox(
                                              height: 20,
                                              // width: 150,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: studentList[index]
                                                        ["Subjects"]
                                                    .length,
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (context, itemIndex) {
                                                  // Assuming the subjects are strings
                                                  String subject =
                                                      studentList[index]
                                                              ["Subjects"]
                                                          [itemIndex];
                                                  // Check if it's the first item to avoid adding a comma before the first subject

                                                  if (itemIndex == 0) {
                                                    return Text(subject,
                                                        style: CustomTextStyles
                                                            .bodySmallff00000010);
                                                  } else {
                                                    return Text(" , $subject",
                                                        style: CustomTextStyles
                                                            .bodySmallff00000010);
                                                  }
                                                },
                                              ))
                                          // ],),

                                          // RichText(
                                          //   text: TextSpan(
                                          //     children: [
                                          //       TextSpan(
                                          //         text: "",
                                          //         style: CustomTextStyles
                                          //             .labelMediumff000000,
                                          //       ),
                                          //       TextSpan(
                                          //         text: studentList[index]["Subjects"],
                                          //         style: CustomTextStyles
                                          //             .bodySmallff00000010,
                                          //       ),
                                          //     ],
                                          //   ),
                                          //   textAlign: TextAlign.left,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    // Padding(
                                    //   padding: const EdgeInsets.symmetric(
                                    //       horizontal: 10, vertical: 5),
                                    //   child: SvgPicture.asset(
                                    //     ImageConstant.imgEdit2,
                                    //     height: 17,
                                    //     width: 17,
                                    //   ),
                                    // ),
                                    GestureDetector(
                                        onTap: () {
                                          print(studentList[0]["id"]);
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return customDeletePopup(context,
                                                  onTap: () {
                                                _controller
                                                    .deleteCat(
                                                        id: studentList[index]
                                                            ["id"])
                                                    .then((value) {
                                                  print(value);
                                                  if (value != null) {
                                                    if (value["is_error"] ==
                                                        false) {
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
                                            setState(() {
                                              studentList.clear();
                                            });
                                            get();
                                            // kycController.fetchTeachingPreferences();
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          child: SvgPicture.asset(
                                            ImageConstant
                                                .imgDelete1LightBlueA400,
                                            height: 22,
                                            width: 22,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ])))
          : const Center(
              child: Text("Please add new Student"),
            ),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  Future<String?> getStringFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPref.STUDENTID);
  }

  Widget _buildSubmit() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => SelectCategory(
                  isParent: true,
                ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgAdd1,
                height: 24,
                color: Colors.black,
                width: 24,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 7,
                  top: 2,
                ),
                child: Text(
                  "Add New Student".tr,
                  style: CustomTextStyles.bodyLargeBlack900_1,
                ),
              ),
            ],
          ),
        ),
        CustomElevatedButton(
            onPressed: () async {
              if (studentList.length > 0) {
                await SharedPref.setStringSp(
                    SharedPref.STUDENTID, studentList[0]["id"].toString());
                // if(
                Get.offAll(() =>
                    NearYouTutor(isMax: studentList.length > 1 ? true : false));
              } else {
                Fluttertoast.showToast(msg: "Please add student first");
              }
            },
            margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
            text: "Continue",
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration),
      ],
    );
  }
}
