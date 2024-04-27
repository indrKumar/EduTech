import 'package:edushalaacademy/View/Student/students_list.dart';
import 'package:edushalaacademy/controllers/StudentController/basicdetails_controller.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/kyc_one/kyc_controller_one.dart';
import '../../models/dropdown_popup.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';

class AddBasicDetails extends StatefulWidget {
  const AddBasicDetails({super.key});

  @override
  State<AddBasicDetails> createState() => _AddBasicDetailsState();
}

class _AddBasicDetailsState extends State<AddBasicDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var dob;
  var genderType;
  var shortTerms;
  var locationPre;
  final TextEditingController _studentName = TextEditingController();
  final TextEditingController _schooltName = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final KycControllerOne kycController = Get.put(KycControllerOne());
  final BasicDetailsController _controller = BasicDetailsController();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = DateFormat('hh:mm a')
            .format(DateTime(2021, 1, 1, picked.hour, picked.minute));
      });
    }
  }

  List<SelectionPopupModel> gender = <SelectionPopupModel>[
    SelectionPopupModel(
      id: 1,
      title: "Male",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Female",
    ),
  ];
  List<SelectionPopupModel> terms = <SelectionPopupModel>[
    SelectionPopupModel(
      id: 1,
      title: "Short term",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Long term",
    ),
  ];
  List<SelectionPopupModel> locationPref = <SelectionPopupModel>[
    SelectionPopupModel(
      id: 1,
      title: "Bhopal",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Indore",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Jabalpur",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
          key: _formKey,
          child: SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 20),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(height: 40),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Add ",
                                  style:
                                      CustomTextStyles.titleMediumcc000000Bold),
                              TextSpan(
                                  text: "Basic Details",
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
                        const SizedBox(height: 19),
                        _buildTime(),
                        const SizedBox(height: 15),
                        Padding(
                            padding: const EdgeInsets.only(left: 4, right: 5),
                            child: CustomDropDown(
                              hintText: "Gender",
                              items: gender,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 32,
                                color: Color(0XFF00C1FF),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  genderType = val.title;
                                });
                              },
                            )),
                        const SizedBox(height: 17),
                        _buildDateOfBirth(),
                        const SizedBox(height: 15),
                        _buildName(),
                        const SizedBox(height: 14),
                        _buildTime1(),
                        const SizedBox(height: 25),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomDropDown(
                              hintText: "Short term/long term",
                              items: terms,
                              onChanged: (val) {
                                setState(() {
                                  shortTerms = val.title;
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 32,
                                color: Color(0XFF00C1FF),
                              ),
                            )),
                        const SizedBox(height: 18),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CustomDropDown(
                              hintText: "Tuition Location Preference",
                              items: locationPref,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 32,
                                color: Color(0XFF00C1FF),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  locationPre = val.title;
                                });
                              },
                            )),
                      ])
                ]),
              )))),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  Widget _buildTime() {
    return Padding(
        padding: const EdgeInsets.only(left: 4, right: 5),
        child: CustomTextFormField(
            controller: _studentName,
            // controller: controller.timeController,
            hintText: "Student Name",
            validator: (value) {
              // if (!isText(value)) {
              //   return "err_msg_please_enter_valid_text".tr;
              // }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildDateOfBirth() {
    return GestureDetector(
        onTap: () {
          onTapDateOfBirth();
        },
        child: Container(
            margin: const EdgeInsets.only(left: 4, right: 5),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            decoration: AppDecoration.outlinePrimary
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 5),
                      child: dob != null
                          ? Text("$dob", style: theme.textTheme.bodySmall)
                          : Text("Date of Birth",
                              style: theme.textTheme.bodySmall)),
                  CustomImageView(
                      imagePath: ImageConstant.imgCalendar,
                      height: 24,
                      width: 24,
                      color: const Color(0XFF00C1FF),
                      margin: const EdgeInsets.only(top: 1))
                ])));
  }

  Widget _buildName() {
    return Padding(
        padding: const EdgeInsets.only(left: 4, right: 5),
        child: CustomTextFormField(
            controller: _schooltName,
            hintText: "School/College/University Name",
            validator: (value) {
              // if (!isText(value)) {
              //   return "err_msg_please_enter_valid_text".tr;
              // }
              return null;
            }));
  }

  /// Section Widget
  Widget _buildTime1() {
    return Padding(
        padding: const EdgeInsets.only(left: 4, right: 5),
        child: CustomTextFormField(
            controller: _timeController,
            onTap: () {
              _selectTime(context);
            },
            readOnly: true,
            hintText: "Preferred time duration",
            textInputAction: TextInputAction.done,
            suffix: Container(
                margin: const EdgeInsets.fromLTRB(30, 11, 18, 10),
                child: CustomImageView(
                    imagePath: ImageConstant.imgClockLightBlueA400,
                    color: const Color(0XFF00C1FF),
                    height: 24,
                    width: 24)),
            suffixConstraints: const BoxConstraints(maxHeight: 45),
            contentPadding:
                const EdgeInsets.only(left: 19, top: 15, bottom: 15)));
  }

  /// Section Widget
  Widget _buildSubmit() {
    return CustomElevatedButton(
        onPressed: () {
          List<int> subCategoryIds = kycController.selectedSubCategories
              .map((subCategory) => subCategory.id)
              .toList();
          _controller
              .addBasicDetails(
                  gender: genderType,
                  name: _studentName.text,
                  dob: dob,
                  location: locationPre,
                  terms: shortTerms,
                  schoolName: _schooltName.text,
                  subjects: subCategoryIds,
                  time: _timeController.text)
              .then((value) {
                print(subCategoryIds[0]);
            print(value);
            if (value["is_error"] == false) {
              Fluttertoast.showToast(msg: "Added Successfully");
              Get.offAll(() => const StudentsLists());
            } else {
              Fluttertoast.showToast(msg: "All fields are mandatory");
            }
          });
        },
        margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
        text: "Submit",
        decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration);
  }

  Future<void> onTapDateOfBirth() async {
    DateTime selectedDate = DateTime.now(); // Initialize with current date
     await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .then((DateTime? pickedDate) {
      if (pickedDate != null) {
        selectedDate = pickedDate;
        String formattedDate = SharedPref.format(selectedDate);
        print(formattedDate);
        setState(() {
          dob = formattedDate;
        }); // Use the selected date in your code or save it in a variable
      }
    });
  }
}
