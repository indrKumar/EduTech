import 'package:edushalaacademy/View/Student/add_student_start_screen.dart';
import 'package:edushalaacademy/View/auth/signup_send_otp.dart';
import 'package:edushalaacademy/View/main_actity.dart';
import 'package:edushalaacademy/View/onBoarding/1st_overview_screen.dart';
import 'package:edushalaacademy/View/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/manage_screen_controller.dart';
import '../../controllers/status_controller.dart';
import '../../controllers/usertyep_controller.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../../utils/store_local_data.dart';
import '../widgets/back_card.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_image_view.dart';

class OtpLoginScreen extends StatefulWidget {
  bool? signUp = false;
  String? number;
  bool? isParent = false;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? modeOfMode;
  String? state;
  String? city;
  String? location;
  String? referral;

  OtpLoginScreen(
      {super.key,
      this.signUp,
        this.location,
      this.number,
      this.isParent,
      this.gender,
        this.state,
      this.city,
      this.email,
      this.firstName,
      this.lastName,
      this.modeOfMode,
      this.referral});

  @override
  State<OtpLoginScreen> createState() => _OtpLoginScreenState();
}

class _OtpLoginScreenState extends State<OtpLoginScreen> {
  final AuthController apiController = Get.put(AuthController());

  String expectedOTP = "1111"; // Define the expected OTP here
  TextEditingController otpController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyController myController = Get.put(MyController());
  final UserTypeController userTypeController = Get.find();
  @override
  Widget build(BuildContext context) {
    print("Signu${widget.signUp}");
    print("STATATTAT ${widget.state}");
    return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // CustomImageView(
                  //   imagePath: ImageConstant.imgEllipse214,
                  //   height: 582.w,
                  //   width: 390.h,
                  //   alignment: Alignment.bottomCenter,
                  // ),
                  // CustomImageView(
                  //   imagePath: ImageConstant.imgSketchDoodles612x390,
                  //   height: 612.w,
                  //   width: 390.h,
                  //   alignment: Alignment.topCenter,
                  // ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 500.h,
                      width: double.maxFinite,
                      child: Form(
                        key: _formKey,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              child:backCard(context),
                      ),
                            _buildBackOne(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 32),
              child: CustomElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    if (userTypeController.isTeacher.value) {
                      if (widget.signUp == true) {
                        apiController
                            .registerDriver(
                            location: widget.location,
                            state: widget.state,
                            mobile: widget.number,
                            email: widget.email,
                            otp: otpController.text,
                            first_name: widget.firstName,
                            last_name: widget.lastName,
                            referral_code: widget.referral,
                            city: widget.city,
                            mode_of_tution: widget.modeOfMode)
                            .then((value) {
                          print("Responsiveness: $value");
                          if (value["is_error"] == false) {
                            Fluttertoast.showToast(msg: "Signup Successfully");
                            SharedPref.accessToken =
                                value['access_token'].toString();
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_ACCESS_TOKEN,
                              value["access_token"].toString(),
                            );
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_REFRESH_TOKEN,
                              value["refresh_token"].toString(),
                            );
                            SharedPref.setBoolSp(
                              SharedPref.SP_KEY_IS_LOGGED_IN,
                              true,
                            );
                            Get.offAll(() => FirstOverView_Screen());
                          } else {
                            Fluttertoast.showToast(msg: value["message"]);
                          }
                        }).catchError((error) {
                          // Handle error if API call fails
                          print("Error: $error");
                          // Show a toast message for error
                          Fluttertoast.showToast(msg: "Failed to verify OTP");
                        });
                      } else {
                        apiController
                            .verifyOTP(
                          contactNo: widget.number,
                          otp: otpController.text,
                        )
                            .then((value) {
                          print("Response: $value");
                          if (value["is_error"] == false) {
                            Fluttertoast.showToast(msg: "Login Successfully");
                            SharedPref.accessToken =
                                value['access_token'].toString();
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_ACCESS_TOKEN,
                              value["access_token"].toString(),
                            );
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_REFRESH_TOKEN,
                              value["refresh_token"].toString(),
                            );
                            SharedPref.setBoolSp(
                              SharedPref.SP_KEY_IS_LOGGED_IN,
                              true,
                            );
                            navigateBasedOnStatus();
                            // Get.offAll(() => const MainActivity());
                          } else {
                            Fluttertoast.showToast(msg: "Please Signup First!");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpSendOTP(
                                  otp: otpController.text,
                                  number: widget.number,
                                ),
                              ),
                            );
                          }
                        }).catchError((error) {
                          // Handle error if API call fails
                          print("Error: $error");
                          // Show a toast message for error
                          Fluttertoast.showToast(msg: "Failed to verify OTP");
                        });
                      }
                    } else {
                      if (widget.signUp == true) {
                        apiController
                            .registerParent(
                            state: widget.state,
                            mobile: widget.number,
                            location: widget.location??'',
                            email: widget.email,
                            otp: otpController.text,
                            first_name: widget.firstName,
                            last_name: widget.lastName,
                            referral_code: widget.referral,
                            city: widget.city,
                            mode_of_tution: widget.modeOfMode,
                            gender: widget.gender)
                            .then((value) {
                          print("Response: $value");
                          if (value["is_error"] == false) {
                            Fluttertoast.showToast(msg: "Signup Successfully");
                            SharedPref.accessToken =
                                value['access_token'].toString();
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_ACCESS_TOKEN,
                              value["access_token"].toString(),
                            );
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_REFRESH_TOKEN,
                              value["refresh_token"].toString(),
                            );
                            SharedPref.setBoolSp(
                              SharedPref.SP_KEY_IS_LOGGED_IN,
                              true,
                            );
                            Get.offAll(() => const AddStudentStartScreen());
                          } else {
                            Fluttertoast.showToast(msg: "Something Went Wrong");
                          }
                        }).catchError((error) {
                          // Handle error if API call fails
                          print("Error: $error");
                          // Show a toast message for error
                          Fluttertoast.showToast(msg: "Failed to verify OTP");
                        });
                        Get.to(OtpLoginScreen(signUp: true));
                      } else {
                        apiController
                            .verifyOTPParent(
                          contactNo: widget.number,
                          otp: otpController.text,
                        )
                            .then((value) {
                          print("Response: $value");
                          if (value["is_error"] == false) {
                            Fluttertoast.showToast(msg: "Login Successfully");
                            SharedPref.accessToken =
                                value['access_token'].toString();
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_ACCESS_TOKEN,
                              value["access_token"].toString(),
                            );
                            SharedPref.setStringSp(
                              SharedPref.SP_KEY_REFRESH_TOKEN,
                              value["refresh_token"].toString(),
                            );
                            SharedPref.setBoolSp(
                              SharedPref.SP_KEY_IS_LOGGED_IN,
                              true,
                            );
                            navigateBasedOnStatus();
                            Get.offAll(() => const MainActivity());
                          } else {
                            Fluttertoast.showToast(msg: "Please Signup First!");
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ParentSignUpSendOTP(
                            //       otp: otpController.text,
                            //       number: widget.number,
                            //     ),
                            //   ),
                            // );
                          }
                        }).catchError((error) {
                          // Handle error if API call fails
                          print("Error: $error");
                          // Show a toast message for error
                          Fluttertoast.showToast(msg: "Failed to verify OTP");
                        });
                      }
                    }
                  }else{

                  }
                },
                text: "Login",
                margin: EdgeInsets.only(bottom: 33.h),
                decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
                alignment: Alignment.bottomCenter,
              )),
        ));
  }

  /// Section Widget
  Widget _buildBackOne() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 11.w,
          top: 35.h,
          right: 11.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomIconButton(
                onTap: () {
                  Get.back();
                },
                height: 45.w,
                width: 45.h,
                child: ImageIcon(
                  AssetImage(ImageConstant.imgBack1),
                  color: Colors.white,
                ),
              ),
            ),
            // CustomAppBar(
            //   height: 45.h,
            //   leadingWidth: double.maxFinite,
            //   leading: AppbarLeadingIconbutton(
            //     imagePath: ImageConstant.imgBack1,
            //     margin: EdgeInsets.only(
            //       left: 17.w,
            //       right: 328.w,
            //     ),
            //   ),
            // ),
            SizedBox(height: 19.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: GestureDetector(
                  onTap: () {
                    // Get.to(const CreateNewAccount());
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Confirm ",
                          style: CustomTextStyles.titleMediumcc000000Bold,
                        ),
                        TextSpan(
                          text: "OTP",
                          style: CustomTextStyles.titleMediumff00c1ffBold_1,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 7.w),
                child: Text(
                  "We’ve sent you an OTP on +91-${widget.number}",
                  style: CustomTextStyles.titleSmallBlack900_1,
                ),
              ),
            ),
            SizedBox(height: 45.h),
            CustomPinCodeTextField(
              validator: (value) {
                if (value?.length != 4) {
                  return 'Please enter a 4-digit PIN';
                }
                return null; // Return null if the input is valid
              },
              context: context,
              onChanged: (p0) {
                setState(() {
                  otpController.text = p0;
                });
              },
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 3.h),
            //   padding: EdgeInsets.symmetric(
            //     horizontal: 63.h,
            //     vertical: 1.w,
            //   ),
            //   decoration: AppDecoration.outlinePrimary.copyWith(
            //     borderRadius: BorderRadiusStyle.roundedBorder22,
            //   ),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       SizedBox(height: 25.w),
            //       Text(
            //         "msg",
            //         style: theme.textTheme.bodySmall,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 24.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Not received? ",
                    style: CustomTextStyles.bodyMediumff000000,
                  ),
                  TextSpan(
                    text: "Resend OTP",
                    style: CustomTextStyles.titleSmallInterff00c1ff,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
