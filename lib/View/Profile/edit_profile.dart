import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/custom_button_style.dart';
import '../../theme/theme_helper.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 11),
              child: GestureDetector(
                  onTap: () {
                    onTapArrowLeft();
                  },
                  child: const Icon(Icons.arrow_back_ios)),
            ),
            title: Text(
              "Edit Profile",
              style: theme.textTheme.titleSmall!.copyWith(
                color: appTheme.black900,
              ),
            )),
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(vertical: 22.h),
                        child: Column(children: [
                          _buildFirstName1(),
                        ]))))),
        bottomNavigationBar: _buildUpdateProfile());
  }

  /// Section Widget
  Widget _buildFirstName() {
    return CustomTextFormField(
        // controller: controller.firstNameController,
        hintText: "Your first name",
        validator: (value) {
          return null;

          // if (!isText(value)) {
          //   return "err_msg_please_enter_valid_text".tr;
          // }
          // return null;
        });
  }

  /// Section Widget
  Widget _buildLastName() {
    return CustomTextFormField(
        // controller: controller.lastNameController,
        hintText: "Last name",
        validator: (value) {
          return null;
          // if (!isText(value)) {
          //   return "err_msg_please_enter_valid_text".tr;
          // }
          // return null;
        });
  }

  /// Section Widget
  Widget _buildMobilenovalue() {
    return  CustomTextFormField(
      // controller: controller.mobilenovalueController,
      hintText: "Mobile no.",
      textInputType: TextInputType.phone,
      // validator: (value) {
      //   // if (!isValidPhone(value)) {
      //   //   return "err_msg_please_enter_valid_phone_number".tr;
      //   // }
      //   // return null;
      // }
    );
  }

  /// Section Widget
  Widget _buildFirstName1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(children: [
        SizedBox(
            height: 90.h,
            width: 90.w,
            child: Stack(alignment: Alignment.bottomRight, children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 35,
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 2.w),
                  child: const Icon(
                    Icons.add_circle,
                    color: Color(0xFF00C2FF),
                    size: 40,
                  ))
            ])),
        SizedBox(height: 41.h),
        _buildFirstName(),
        SizedBox(height: 20.h),
        _buildLastName(),
        SizedBox(height: 20.h),
        _buildMobilenovalue(),
        SizedBox(height: 20.h),
        _buildAlternateContactnovalue(),
        SizedBox(height: 20.h),
        _buildEmail(),
      ]),
    );
  }

  Widget _buildAlternateContactnovalue() {
    return  CustomTextFormField(
      onFieldSubmitted: (p0) {
      },
        hintText: "Alternate Contact no.", alignment: Alignment.bottomCenter);
  }

  Widget _buildEmail() {
    return CustomTextFormField(
        hintText: "Email address",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.emailAddress,
        validator: (value) {
          // if (value == null || (!isValidEmail(value, isRequired: true))) {
          //   return "err_msg_please_enter_valid_email".tr;
          // }
          return null;
        });
  }

  Widget _buildUpdateProfile() {
    return CustomElevatedButton(
        text: "Update Profile",
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 39.h),
        decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration);
  }

  onTapArrowLeft() {
    Get.back();
  }
}
