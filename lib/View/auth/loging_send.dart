import 'package:edushalaacademy/View/auth/confirm_otp.dart';
import 'package:edushalaacademy/View/auth/parent/parant_signup.dart';
import 'package:edushalaacademy/View/auth/signup_send_otp.dart';
import 'package:edushalaacademy/View/widgets/back_card.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/manage_screen_controller.dart';
import '../../controllers/usertyep_controller.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';

class LoginMobileScreen extends StatefulWidget {
  String? type;

  LoginMobileScreen({super.key, this.type});

  @override
  State<LoginMobileScreen> createState() => _LoginMobileScreenState();
}

class _LoginMobileScreenState extends State<LoginMobileScreen> {
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController apiController = Get.put(AuthController());
  final MyController myController = Get.put(MyController());
  final UserTypeController userTypeController = Get.find();
  FocusNode myFocusNode = FocusNode();

  @override
  void dispose() {
    textEditingController.dispose();
    myFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("ISSSSSSSSS${userTypeController.isTeacher.value}");
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.maxFinite,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildTen(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => Padding(
          padding: EdgeInsets.only(left: 32.w),
          child: myController.isIndicatorVisible.value
              ? SizedBox(
                  height: 30,
                  child: Center(child: MyCircularProgressIndicator()))
              : CustomElevatedButton(
                  onPressed: () {
                    myController.showCircularProgress();
                    print(userTypeController.isTeacher.value);
                    if (_formKey.currentState!.validate()) {
                      if (userTypeController.isTeacher.value) {
                        apiController
                            .sendOtp(
                                contactNo: textEditingController.text,
                                newUser: false)
                            .then((value) {
                          if (value["is_error"] == false) {
                            if (value['isNewUser'] == false) {
                              myController.hideCircularProgress();
                              Fluttertoast.showToast(msg: "OTP Sent");
                              Get.to(() => OtpLoginScreen(
                                    number: textEditingController.text,
                                    signUp: false,
                                  ));
                            } else {
                              myController.hideCircularProgress();
                              Fluttertoast.showToast(
                                  msg: "Please Signup First!");
                              Get.to(() => SignUpSendOTP(
                                    number: textEditingController.text,
                                    otp: "1111",
                                  ));
                            }
                          } else {
                            Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              myController.hideCircularProgress();
                            });
                            Get.snackbar("Warning", '${value["message"]}');
                            print(value);
                          }
                        });
                      } else {
                        apiController
                            .sendStudentOtp(
                                contactNo: textEditingController.text,
                                newUser: false)
                            .then((value) {
                          print(value);
                          if (value["is_error"] == false) {
                            if (value['isNewUser'] == false) {
                              myController.hideCircularProgress();
                              Fluttertoast.showToast(msg: "OTP Sent");
                              Get.to(() => OtpLoginScreen(
                                  number: textEditingController.text));
                            } else {
                              myController.hideCircularProgress();
                              Fluttertoast.showToast(msg: "OTP Sent");
                              Get.to(() => ParentSignUpSendOTP(
                                    number: textEditingController.text,
                                    otp: "1111",
                                  ));
                            }
                          } else {
                            Future.delayed(const Duration(seconds: 1))
                                .then((value) {
                              myController.hideCircularProgress();
                            });
                            Get.snackbar("Warning", '${value["message"]}');
                            print(value);
                          }
                        });
                      }
                    } else {
                      Future.delayed(const Duration(seconds: 1)).then((value) {
                        myController.hideCircularProgress();
                      });
                    }
                  },
                  text: "Send OTP",
                  margin: const EdgeInsets.only(bottom: 33),
                  decoration:
                      CustomButtonStyles.gradientPrimaryToBlueDecoration,
                  alignment: Alignment.bottomCenter,
                ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTen() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 500.h,
        // width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: backCard(context),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 11,
                  top: 94,
                  right: 11,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Sign in / Login with ",
                            style: CustomTextStyles.titleMediumcc000000Bold,
                          ),
                          TextSpan(
                            text: "Mobile OTP!",
                            style: CustomTextStyles.titleMediumff01a0e2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 11),
                    SizedBox(
                      // width: 344.h,
                      child: Text(
                        "We will send an OTP on your mobile number",
                        // "We’ve sent you an OTP on +91-91091 71244",
                        style: CustomTextStyles.titleSmallBlack900_1,
                      ),
                    ),
                    SizedBox(height: 29.h),
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: CustomTextFormField(
                        focusNode: myFocusNode,
                        textInputType: TextInputType.number,
                        autofocus: true,
                        onFieldSubmitted: (p0) {

                          myFocusNode.unfocus();
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
                        controller: textEditingController,
                        hintText: "91091 71244",
                        textInputAction: TextInputAction.done,
                        suffix: Container(
                          margin: EdgeInsets.fromLTRB(30.w, 12.h, 20.w, 13.h),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgMinimize,
                            height: 20.h,
                            width: 12.w,
                            color: const Color(0xFF00C2FF),
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: 45.h,
                        ),
                        contentPadding: EdgeInsets.only(
                          left: 24.w,
                          top: 11.h,
                          bottom: 11.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
