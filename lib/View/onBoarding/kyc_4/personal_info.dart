import 'dart:io';
import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../controllers/kyc2_controllers/kyc_status_controller.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../models/dropdown_popup.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../../utils/select_file.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final Kyc2StatusController kycOneController = Get.put(Kyc2StatusController());
  late FocusNode altNumberN;

  late FocusNode addN;

  late FocusNode aadharN;

  late FocusNode aadharOtpN;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? licencePathsPic; // Changed to List<File>
  File? licencePathsCertificate; // Changed to List<File>
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _dob = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _aadharOtp = TextEditingController();
  final TextEditingController _aadharNumber = TextEditingController();
  final TextEditingController _uploadImageController = TextEditingController();
  final MyController myController = Get.put(MyController());
  bool sameAsTeacherA = false;

  @override
  void initState() {
    altNumberN = FocusNode();
    addN = FocusNode();
    aadharN = FocusNode();
    aadharOtpN = FocusNode();

    // TODO: implement initState
    super.initState();
  }


  @override
  void dispose() {
    altNumberN.dispose();
    addN.dispose();
    aadharN.dispose();
    aadharOtpN.dispose();
    _mobile.dispose();
    _dob.dispose();
    _address.dispose();
    _aadharNumber.dispose();
    _uploadImageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  void onTapPic() async {
    final file = await pickFileOrTakePhoto(context);
    if (file != null) {
      setState(() {
        licencePathsPic = file;
      });
    }
  }
  void onTapDoc() async {
    final file = await pickFileOrTakePhoto(context);
    if (file != null) {
      setState(() {
        licencePathsCertificate = file;
        _uploadImageController.text = "Uploaded";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 41.w,
            ),
            decoration: AppDecoration.outlineBlack9002.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL25,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                30.h.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Finishing Up",
                    style: CustomTextStyles.titleMediumBlack900,
                  ),
                ),
                SizedBox(height: 13.w),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(right: 24.h),
                    child: Text(
                      "Rest assured, your information is securely stored on our private server. These details are vital, especially as you'll be visiting clients' homes regularly. Ensuring your & client’s security is our top priority. ",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ),
                SizedBox(height: 29.w),
                SizedBox(
                  height: 91.w,
                  width: 94.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      licencePathsPic != null
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              radius: 45,
                              backgroundImage:
                                  FileImage(File(licencePathsPic!.path)),
                            )
                          : CustomImageView(
                              imagePath: ImageConstant.imgAvatar1,
                              height: 69,
                              width: 69,
                              alignment: Alignment.center,
                              color: Colors.grey,
                            ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.w),
                        child: CustomIconButton(
                          onTap:onTapPic,
                          height: 36.h,
                          width: 36.h,
                          padding: EdgeInsets.all(6.h),
                          decoration: IconButtonStyleHelper.fillLightBlueA,
                          alignment: Alignment.bottomRight,
                          child: CustomImageView(
                            color: Colors.white,
                            imagePath: ImageConstant.imgAdd2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 27.w),
                _buildAlternatemobilenovalue(),
                SizedBox(height: 15.w),
                _buildDOBvalue(),
                SizedBox(height: 15.w),
                _buildSelectGendervalue(),
                SizedBox(height: 15.w),
                !sameAsTeacherA ? _buildAddress() : SizedBox(),
                SizedBox(height: 14.w),
                _buildSameAsTeachingAddress(),
                SizedBox(height: 9.w),
                _buildVerify1(),
                SizedBox(height: 15.w),
                _buildAadharOtp(),
                SizedBox(height: 23.w),
                _buildUploadhighestqualificationmark(),
                SizedBox(height: 150.w),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 40),
        child: _buildSubmit(),
      ),
    );
  }

  /// Section Widget
  Widget _buildAlternatemobilenovalue() {
    return CustomTextFormField(
      focusNode: altNumberN,
      onFieldSubmitted: (value) {
        altNumberN.unfocus();
      },
      inputFormatter: LengthLimitingTextInputFormatter(10),
      // Inside the CustomTextFormField for phone number input
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid phone number';
        }
        if (value.length != 10) {
          return 'Phone number must be 10 digits';
        }
        return null; // Return null if the input is valid
      },
      // controller: controller.alternatemobilenovalueController,
      hintText: "Alternate mobile no.",
      controller: _mobile,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.phone,
    );
  }

  /// Section Widget
  Widget _buildDOBvalue() {
    return CustomTextFormField(
      suffix: Icon(
        Icons.date_range,
        color: Colors.grey.shade600,
      ),
      readOnly: true,
      controller: _dob,
      onTap: () {
        DateTime selectedDate = DateTime.now(); // Initialize with current date
        DateFormat dateFormat = DateFormat('dd/MM/yyyy');
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
              _dob.text = formattedDate;
            }); // Use the selected date in your code or save it in a variable
          }
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select DOB';
        }
        return null; // Return null if the input is valid
      },
      hintText: "DOB",
    );
  }

  /// Section Widget
  String _gender = "";
  List<SelectionPopupModel> selectGender = [
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

  ///
  Widget _buildSelectGendervalue() {
    return CustomDropDown(
      hintText: "Select Gender",
      items: selectGender,
      onChanged: (value) {
        setState(() {
          _gender = value.title;
        });
      },
      validator: (value) {
        if (value == null) {
          return 'Please select gender';
        }
        return null; // Return null if the input is valid
      },
    );
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
      focusNode: addN,
      onFieldSubmitted: (p0) {
        addN.unfocus();
      },
      controller: _address,
      // controller: controller.addressController,
      hintText: "Your Permanent Address",
    );
  }

  /// Section Widget
  Widget _buildAadharOtp() {
    return CustomTextFormField(
      focusNode: aadharN,
      onFieldSubmitted: (p0) {
        aadharN.unfocus();
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Aadhar OTP';
        }
        return null; // Return null if the input is valid
      },
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.done,
      controller: _aadharOtp,
      // controller: controller.addressController,
      hintText: "Aadhar OTP",
    );
  }

  /// Section Widget
  Widget _buildSameAsTeachingAddress() {
    return Padding(
      padding: EdgeInsets.only(right: 5.h),
      child:
          // Obx(
          //       () =>
          Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomCheckboxButton(
            value: sameAsTeacherA,
            alignment: Alignment.centerRight,
            text: "Same as teaching address",
            // value: controller.sameAsTeachingAddress.value,
            onChange: (value) {
              setState(() {
                sameAsTeacherA = !sameAsTeacherA;
              });
              // controller.sameAsTeachingAddress.value = value;
            },
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildVerify() {
    return CustomOutlinedButton(
      decoration: BoxDecoration(),
      height: 55,
      width: 94.h,
      text: "Verify",
      buttonStyle: CustomButtonStyles.outlinePrimary,
      buttonTextStyle: CustomTextStyles.bodySmallPrimaryContainer,
      alignment: Alignment.centerRight,
    );
  }

  /// Section Widget
  Widget _buildVerify1() {
    return SizedBox(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          CustomTextFormField(
            focusNode: aadharOtpN,
            onFieldSubmitted: (p0) {
              aadharOtpN.unfocus();
            },
            controller: _aadharNumber,
            inputFormatter: LengthLimitingTextInputFormatter(12),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter Aadhar OTP';
              } else if (value.length != 12) {
                return 'Please enter 12 digit';
              }
              return null; // Return null if the input is valid
            },
            hintText: "Aadhar No",
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.done,
          ),
          _buildVerify(),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUploadhighestqualificationmark() {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 5.h,
      ),
      child: CustomTextFormField(
        controller: _uploadImageController,
        onTap: onTapDoc,
        readOnly: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Upload you qualification mark sheet';
          }
          return null; // Return null if the input is valid
        },
        // controller: controller.uploadhighestqualificationmarkController,
        hintText: "Upload highest qualification mark sheet",
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
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
              print(SharedPref.accessToken);
              if (_formKey.currentState!.validate()) {
                myController.showCircularProgress();
                kycOneController
                    .addPersonalDetails(
                        gender: _gender.toString(),
                        aadhaar: _aadharNumber.text,
                        address: !sameAsTeacherA ? _address.text : "",
                        certificate: licencePathsCertificate?.path,
                        dob: _dob.text,
                        mobile: _mobile.text,
                        pic: licencePathsPic?.path,
                        same_as_techingAddress: sameAsTeacherA)
                    .then((value) {
                  print(value);
                  if (value != null) {
                    if (value["is_error"] == false) {
                      Get.offAll(const Kyc_Step_Four_Vidio());
                      myController.hideCircularProgress();
                    } else {
                      Fluttertoast.showToast(msg: "Something went wrong");
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Something went wrong");
                    Future.delayed(Duration(seconds: 1)).then((value) {
                      myController.hideCircularProgress();
                    });
                  }
                  print(value);
                });
              } else {}
            },
            text: "Submit",
            // buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
          );
  }
}
