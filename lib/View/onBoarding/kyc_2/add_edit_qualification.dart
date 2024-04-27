import 'dart:io';

import 'package:edushalaacademy/View/onBoarding/kyc_2/edu_qualification_list.dart';
import 'package:edushalaacademy/models/dropdown_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../controllers/usertyep_controller.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/select_file.dart';
import '../../widgets/circularindicaror.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AddEditQualifications extends StatefulWidget {
  bool? isEdit;
  final String? id;

  AddEditQualifications({super.key, this.id, this.isEdit});

  @override
  State<AddEditQualifications> createState() => _AddEditQualificationsState();
}

class _AddEditQualificationsState extends State<AddEditQualifications> {
  EducationController educationController = Get.put(EducationController());
  bool isloading = false;

  Future get() async {
    if (widget.isEdit == true) {
      await educationController
          .getEducationDetails(id: widget.id.toString())
          .then((value) {
        // print(value);
        print(educationController.eduQualificationsDetails.length > 0);
        if (educationController.eduQualificationsDetails.length > 0) {
          setState(() {
            selectedType = educationController.eduQualificationsDetails[0].name
                    .toString() ??
                '';
            selectedBoards =
                educationController.eduQualificationsDetails[0].board ?? '';
            selectedMediums =
                educationController.eduQualificationsDetails[0].medium ?? '';
            selectedYears = educationController
                    .eduQualificationsDetails[0].completedYear
                    .toString() ??
                '';
            percentageController.text = educationController
                    .eduQualificationsDetails[0].percentage
                    .toString() ??
                '';
            schoolCollageController.text = educationController
                    .eduQualificationsDetails[0].institutionName
                    .toString() ??
                '';
            currentlyStudying =
                educationController.eduQualificationsDetails[0].studying;
            licencePaths = File(
                educationController.eduQualificationsDetails[0].marksheet ??
                    '');
            isloading = false;
          });
        } else {}
      });
    } else {}
  }

  @override
  void initState() {
    get();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    percentageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  String selectedType = "";
  String selectedBoards = "";
  String selectedMediums = "";
  String selectedYears = "";
  File? licencePaths; // Changed to List<File>
  TextEditingController percentageController = TextEditingController();
  TextEditingController schoolCollageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyController myController = Get.put(MyController());
  final UserTypeController userTypeController = Get.put(UserTypeController());
  List<SelectionPopupModel> selectedClass = [
    SelectionPopupModel(
      id: 1,
      title: "Graduation",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "APG",
    ),
    SelectionPopupModel(
      id: 3,
      title: "PHD",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Diploma",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Others",
    ),
  ];
  List<SelectionPopupModel> selectedMedium = [
    SelectionPopupModel(
      id: 1,
      title: "Hindi",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "English",
    ),
  ];
  List<SelectionPopupModel> selectedYear = [
    SelectionPopupModel(
      id: 1,
      title: "2010",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "2011",
    ),
    SelectionPopupModel(
      id: 3,
      title: "2013",
    ),
    SelectionPopupModel(
      id: 4,
      title: "2014",
    ),
    SelectionPopupModel(
      id: 5,
      title: "2015",
    ),
  ];
  List<SelectionPopupModel> selectedBoard = [
    SelectionPopupModel(
      id: 1,
      title: "MP BOARD",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "CBSE",
    ),
    SelectionPopupModel(
      id: 3,
      title: "ICSE",
    ),
    SelectionPopupModel(
      id: 4,
      title: "NIOS",
    ),
    SelectionPopupModel(
      id: 5,
      title: "State Boards",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Others",
    ),
  ];


  void onTap() async {
    final file = await pickFileOrTakePhoto(context);
    if (file != null) {
      setState(() {
        licencePaths = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(selectedBoards);
    print(educationController.eduQualificationsDetails);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 19.w,
            vertical: 40.h,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Add ",
                            style: CustomTextStyles.titleMediumcc000000,
                          ),
                          TextSpan(
                            text: "New Qualification",
                            style: CustomTextStyles.titleMediumff00c1ffBold,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    // width: 325.h,
                    margin: EdgeInsets.only(right: 24.w),
                    child: Text(
                      "You can choose one category at a time. If you want to choose more than one category, first complete the details of one selected category. ",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 19.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: CustomDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your class';
                      }
                      return null;
                    },
                    hintText:
                        selectedType.isEmpty ? "Select Class" : selectedType,
                    items: selectedClass,
                    onChanged: (value) {
                      setState(() {
                        selectedType = value.title;
                      });
                      // controller.onSelected(value);
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: CustomDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your Board';
                      }
                      return null;
                    },
                    hintText: selectedBoards.isEmpty
                        ? "Select Board"
                        : selectedBoards,
                    items: selectedBoard,
                    onChanged: (value) {
                      setState(() {
                        selectedBoards = value.title;
                      });
                      // controller.onSelected3(value);
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: CustomDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your Medium';
                      }
                      return null;
                    },
                    hintText: selectedMediums.isEmpty
                        ? "Select Medium"
                        : selectedMediums,
                    items: selectedMedium,
                    onChanged: (value) {
                      setState(() {
                        selectedMediums = value.title;
                      });
                      // controller.onSelected3(value);
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: CustomDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your completed year';
                      }
                      return null;
                    },
                    hintText: selectedYears.isEmpty
                        ? "Select Completed Year"
                        : selectedYears,
                    items: selectedYear,
                    onChanged: (value) {
                      setState(() {
                        selectedYears = value.title;
                      });
                      // controller.onSelected3(value);
                    },
                  ),
                ),
                SizedBox(height: 13.h),
                _buildCurrentlyStudying(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 5.w,
                  ),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your Percentage';
                      }
                      return null;
                    },
                    textInputType: TextInputType.number,
                    inputFormatter: LengthLimitingTextInputFormatter(3),
                    controller: percentageController,
                    // controller: controller.percentageController,
                    hintText: "Percentage",
                  ),
                ),
                SizedBox(height: 15.h),
                _buildInstitution(),
                SizedBox(height: 14.h),
                _buildUploadMarksheets(),
                SizedBox(height: 140.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSubmit(),
            SizedBox(height: 21.h),
            GestureDetector(
              onTap: () {
                // Get.to(const Kyc_Step_One_Screen());
                Get.off(const EduQualificationList());
              },
              child: Text(
                "Cancel",
                style: CustomTextStyles.bodyLargeBlack900,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool currentlyStudying = false;

  Widget _buildCurrentlyStudying() {
    return Padding(
      padding: EdgeInsets.only(right: 5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomCheckboxButton(
            alignment: Alignment.centerRight,
            text: "Currently studying",
            value: currentlyStudying,
            padding: EdgeInsets.symmetric(vertical: 1.h),
            onChange: (value) {
              setState(() {
                currentlyStudying = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInstitution() {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 5.w,
      ),
      child: CustomTextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your School/College/University';
          }
          return null;
        },
        controller: schoolCollageController,
        // controller: controller.institutionController,
        hintText: "School/College/University",
      ),
    );
  }

  Widget _buildUploadMarksheets() {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 5.w,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.h),
              border: Border.all(
                color: theme.colorScheme.primary,
              )),
          width: double.infinity,
          child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: licencePaths != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Uploaded",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color:
                                    theme.colorScheme.primary.withOpacity(0.7)),
                          ),
                          const Icon(Icons.add_link_sharp)
                        ],
                      )
                    : Text("Upload Mark sheets (Optional)",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade400)),
              )),
        ),
      ),

      // CustomTextFormField(
      //   // controller: controller.uploadMarksheetsController,
      //   hintText: "Upload Mark sheets (Optional)",
      //   textInputAction: TextInputAction.done,
      // ),
    );
  }

  Widget _buildSubmit() {
    return Obx(
      () => myController.isIndicatorVisible.value
          ? SizedBox(
              height: 30, child: Center(child: MyCircularProgressIndicator()))
          : CustomElevatedButton(
              text: "Submit",
              onPressed: () {
                print("object");
                if (_formKey.currentState!.validate()) {
                  print("objectddss");
                  myController.showCircularProgress();
                  if (widget.isEdit == false) {
                    educationController
                        .addNewQualification(
                            imagePath: licencePaths?.path,
                            year: selectedYears,
                            board: selectedBoards,
                            className: selectedType,
                            institutionName: schoolCollageController.text,
                            medium: selectedMediums,
                            percentage: percentageController.text,
                            studying: currentlyStudying)
                        .then((value) {
                      print(value);
                      if (value != null) {
                        if (value["is_error"] == false) {
                          Get.offAll(() => const EduQualificationList());
                          myController.hideCircularProgress();
                        } else {
                          Fluttertoast.showToast(
                              msg: "All fields are mandatory");
                          Future.delayed(const Duration(seconds: 1))
                              .then((value) {
                            myController.hideCircularProgress();
                          });
                        }
                      } else {
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) {
                          myController.hideCircularProgress();
                        });
                        // Fluttertoast.showToast(msg: "All fields are mandatory");
                      }
                    });
                  } else {
                    educationController
                        .editNewQualification(
                            id: widget.id,
                            imagePath: licencePaths!.path.startsWith('http')
                                ? ""
                                : licencePaths,
                            year: selectedYears,
                            board: selectedBoards,
                            className: selectedType,
                            institutionName: schoolCollageController.text,
                            medium: selectedMediums,
                            percentage: percentageController.text,
                            studying: currentlyStudying)
                        .then((value) {
                      if (value != null) {
                        if (value["is_error"] == false) {
                          Get.offAll(() => const EduQualificationList());
                          myController.hideCircularProgress();
                        } else {
                          Fluttertoast.showToast(
                              msg: "All fields are mandatory");
                          Future.delayed(const Duration(seconds: 1))
                              .then((value) {
                            myController.hideCircularProgress();
                          });
                        }
                      } else {
                        Fluttertoast.showToast(msg: "All fields are mandatory");
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) {
                          myController.hideCircularProgress();
                        });
                      }

                      // Get.to(const Kyc_Step_One_Screen());
                    });
                  }
                } else {
                  print("objec1");
                }

                // Get.to(const Kyc_Step_One_Screen());
              },
              // buttonStyle: CustomButtonStyles.none,
              decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            ),
    );
  }
}
