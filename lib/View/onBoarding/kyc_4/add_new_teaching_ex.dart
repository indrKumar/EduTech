import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/controllers/kyc2_controllers/teaching_ex_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../models/dropdown_popup.dart';
import '../../../models/experience_details_model.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AddNewTeachingExperience extends StatefulWidget {
  bool? isEdit;
  var id;

  AddNewTeachingExperience({super.key, this.isEdit, this.id});

  @override
  State<AddNewTeachingExperience> createState() =>
      _AddNewTeachingExperienceState();
}

class _AddNewTeachingExperienceState extends State<AddNewTeachingExperience> {
  final TeachingEx_Controller _teachingExController =
      Get.put(TeachingEx_Controller());
  String selectedType = "";
  List<SelectionPopupModel> list = [
    SelectionPopupModel(
      id: 1,
      title: "Teaching",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Non Teaching",
    ),
  ];

  bool isYes = true;
  bool isNo = false;
  final TextEditingController _companyName = TextEditingController();
  final TextEditingController _degignation = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _duration = TextEditingController();
  final TextEditingController _whichClass = TextEditingController();
  final TextEditingController _whichBoard = TextEditingController();
  final TextEditingController selectedYearController = TextEditingController();
  final TextEditingController selectedYearEndController =
      TextEditingController();
  final TextEditingController _whichSubject = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int selectedYear = DateTime.now().year;
  int selectedYearEnd = DateTime.now().year;

  Future<void> _selectYear(BuildContext context) async {
    DateTime selectedDate = DateTime.now(); // Initialize with current date
    DateFormat dateFormat = DateFormat('MMM yyyy');
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((DateTime? pickedDate) {
      if (pickedDate != null && pickedDate != selectedDate) {
        selectedDate = pickedDate;
        String formattedDate = dateFormat.format(selectedDate);
        setState(() {
          selectedYearController.text = formattedDate;
        }); // Use the
      }
    });
  }
  Future<void> _selectYearEnd(BuildContext context) async {
    DateTime selectedDate = DateTime.now(); // Initialize with current date
    DateFormat dateFormat = DateFormat('MMM yyyy');
    showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((DateTime? pickedDate) {
      if (pickedDate != null && pickedDate != selectedDate) {
        selectedDate = pickedDate;
        String formattedDate = dateFormat.format(selectedDate);
        setState(() {
          selectedYearEndController.text = formattedDate;

        }); // Use the
      }
    });
  }

  late TeachingExperience _teachingExperience;
  Future get() async {
    if (widget.isEdit == true) {
      print("object");
      TeachingExperience teachingExperience = await _teachingExController.getTeachingExDetails(id: widget.id);
        _teachingExperience = teachingExperience;
        _companyName.text = _teachingExperience.name;
        selectedType = _teachingExperience.type;
        _degignation.text = _teachingExperience.designation ?? '';
        _description.text = _teachingExperience.about ?? '';
        _duration.text = _teachingExperience.duration ?? '';
        _whichClass.text = _teachingExperience.classes ?? '';
        _whichSubject.text = _teachingExperience.subjects ?? '';
        _whichBoard.text = _teachingExperience.board ?? '';
        selectedYearController.text = _teachingExperience.startYear!.isEmpty ? '':_teachingExperience.startYear.toString();
        selectedYearEndController.text = _teachingExperience.endYear!.isEmpty ?'':_teachingExperience.endYear.toString();
      // await _teachingExController
      //     .getTeachingExDetails(id: widget.id)
      //     .then((value) {
      //   if (_teachingExController.eduQualificationsDetails.isNotEmpty) {
      //     var data = _teachingExController.eduQualificationsDetails[0];
      setState(() {});

        }
    else {
      // setState(() {});
    }
}


  final MyController myController = Get.put(MyController());
  late FocusNode company;
  late FocusNode designation;
  late FocusNode duration;
  late FocusNode clas;
  late FocusNode bod;
  late FocusNode subj;
  late FocusNode description;
  @override
  void initState() {
    company = FocusNode();
    designation = FocusNode();
    duration = FocusNode();
    clas = FocusNode();
    bod = FocusNode();
    subj = FocusNode();
    description = FocusNode();
    get().then((value) {
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    company.dispose();
    designation.dispose();
    duration.dispose();
    clas.dispose();
    bod.dispose();
    subj.dispose();
    description.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.h,
                    vertical: 42.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.h.verticalSpace,
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Add New ",
                                style: CustomTextStyles.titleMediumcc000000,
                              ),
                              TextSpan(
                                text: "Work Experience",
                                style: CustomTextStyles.titleMediumff00c1ffBold,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 51.w),
                      CustomDropDown(
                        hintText: selectedType.isEmpty ? "Teaching / Non Teaching":selectedType,
                        items: list,
                        onChanged: (value) {
                          setState(() {
                            selectedType = value.title;
                          });
                          // controller.onSelected3(value);
                        },
                        icon: const Icon(Icons.keyboard_arrow_down_sharp,
                            size: 32, color: Colors.white),
                      ),
                      SizedBox(height: 15.w),
                      CustomTextFormField(
                        focusNode: company,
                        textInputType: TextInputType.name,
                        controller: _companyName,
                        // controller: controller.percentageController,
                        hintText: "Company name",
                      ),
                      SizedBox(height: 16.w),
                      CustomTextFormField(
                        focusNode:designation,
                        controller: _degignation,
                        // controller: controller.yourDesignationController,
                        hintText: "Your Designation",
                      ),
                      SizedBox(height: 16.w),
                      if (selectedType == "Teaching") _buildDuration(),
                      if (selectedType == "Teaching") SizedBox(height: 16.w),
                      if (selectedType != "Teaching")
                        Padding(
                          padding: EdgeInsets.only(
                            // left: 6.h,
                            right: 10.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextFormField(
                                readOnly: true,
                                onTap: () {
                                  _selectYear(context);
                                },
                                controller: selectedYearController,
                                hintText: "Start Year",
                                width: MediaQuery.of(context).size.width * 0.4,
                                // controller: controller.editTextController,
                              ),
                              CustomTextFormField(
                                readOnly: true,
                                controller: selectedYearEndController,
                                onTap: () {
                                  _selectYearEnd(context);
                                },
                                hintText: "End Year",
                                width: MediaQuery.of(context).size.width * 0.4,
                                // controller: controller.editTextController,
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 13.w),
                      Text(
                        "Currently working here",
                        style: CustomTextStyles.labelLargeBlack900Bold_1,
                      ),
                      SizedBox(height: 14.w),
                      Padding(
                        padding: EdgeInsets.only(right: 160.h),
                        child: Row(
                          children: [
                            CustomCheckboxButton(
                              text: "Yes",
                              value: isYes,
                              // value: controller.yes.value,
                              textStyle: CustomTextStyles.labelLargeBlack900_5,
                              onChange: (value) {
                                setState(() {
                                  isYes = true;
                                  isNo = false;
                                });
                              },
                            ),
                            const Spacer(),
                            CustomCheckboxButton(
                              text: "No",
                              value: isNo,
                              textStyle: CustomTextStyles.labelLargeBlack900_5,
                              onChange: (value) {
                                setState(() {
                                  isYes = false;
                                  isNo = true;
                                });
                                // controller.yes.value = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.w),
                      if (selectedType == "Teaching")
                        _buildClassBoardSubject(
                          autofocus: false,
                          focusNode: clas,
                            controller: _whichClass,
                            hint: "Which Class(s) have you taught here?"),
                      if (selectedType == "Teaching") SizedBox(height: 16.w),
                      if (selectedType == "Teaching")
                        _buildClassBoardSubject(
                            autofocus: false,
                          focusNode: bod,
                            controller: _whichBoard,
                            hint: "Which Board have you taught here?"),
                      if (selectedType == "Teaching") SizedBox(height: 16.w),
                      if (selectedType == "Teaching")
                        _buildClassBoardSubject(
                          focusNode: subj,
                            autofocus: false,
                            controller: _whichSubject,
                            hint: "Which Subject(s) have you taught here?"),
                      if (selectedType == "Teaching") SizedBox(height: 21.w),
                      _buildProfileDescription(),
                      SizedBox(height: 172.w),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Add New Teaching Experience",
                        style: CustomTextStyles.titleMediumccffffff16,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
          child: Obx(() => _buildSubmit()),
        )
        // _buildBottomBar(),
        );
  }

  Widget _buildClassBoardSubject({hint, controller,FocusNode? focusNode,autofocus=false}) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: CustomTextFormField(
        focusNode: focusNode,
        autofocus: autofocus,
        controller: controller,
        hintText: hint,
      ),
    );
  }

  Widget _buildDuration() {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: CustomTextFormField(
        focusNode:duration,
        autofocus: false,
        textInputType: TextInputType.phone,
        controller: _duration,
        hintText: "Duration (0-1, 1-3, 4-5, 5+)",
      ),
    );
  }

  Widget _buildProfileDescription() {
    return Padding(
      padding: EdgeInsets.only(right: 11.h),
      child: CustomTextFormField(
        focusNode:description,
        controller: _description,
        autofocus: false,
        hintText: "Write few lines about your profile (Optional)",
        textInputAction: TextInputAction.done,
        maxLines: 6,
        borderDecoration: TextFormFieldStyleHelper.outlinePrimaryTL14,
      ),
    );
  }

  Widget _buildSubmit() {
    return myController.isIndicatorVisible.value
        ? SizedBox(
            height: 30,
            child: Center(
              child: MyCircularProgressIndicator(),
            ),
          )
        : CustomElevatedButton(
            onPressed: () {
              myController.showCircularProgress();
              print(selectedYearEndController.text);
              if (widget.isEdit == false) {
                print("ADD");
                _teachingExController
                    .addTeachingEx(
                        board: _whichBoard.text,
                        name: _companyName.text,
                        type: selectedType,
                        about: _description.text,
                        classes: _whichClass.text,
                        designation: _degignation.text,
                        duration: _duration.text,
                        subjects: _whichSubject.text,
                        start_year: selectedType == "Teaching"
                            ? ""
                            : selectedYearController.text,
                        end_year: selectedType == "Teaching"
                            ? ""
                            : selectedYearEndController.text,
                        working: isYes)
                    .then((value) {
                  if (value != null) {
                    if (value["is_error"] == false) {
                      Fluttertoast.showToast(msg: "Added successFully");
                      myController.hideCircularProgress();
                      Get.back();
                    } else {
                      Fluttertoast.showToast(msg: "Internal issue");
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                  }
                });
              } else {
                print("UPDATEDTEDTEDTE");
                _teachingExController
                    .editTeachingEx(
                        id: widget.id,
                        board: _whichBoard.text,
                        name: _companyName.text,
                        type: selectedType,
                        about: _description.text,
                        classes: _whichClass.text,
                        designation: _degignation.text,
                        duration: _duration.text,
                        subjects: _whichSubject.text,
                        start_year: selectedType == "Teaching"
                            ? ""
                            : selectedYearController.text,
                        end_year: selectedType == "Teaching"
                            ? ""
                            : selectedYearEndController.text,
                        working: isYes)
                    .then((value) {
                  if (value != null) {
                    if (value["is_error"] == false) {
                      Get.back();
                      myController.hideCircularProgress();
                    } else {
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                  }
                });
              }
            },
            text: "Submit",
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          );
  }
}
