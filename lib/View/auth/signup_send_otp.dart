import 'package:edushalaacademy/View/auth/confirm_otp.dart';
import 'package:edushalaacademy/View/auth/loging_send.dart';
import 'package:edushalaacademy/View/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/city_controller.dart';
import '../../controllers/manage_screen_controller.dart';
import '../../controllers/usertyep_controller.dart';
import '../../models/dropdown_popup.dart';
import '../../theme/custom_button_style.dart';
import '../../theme/custom_text_style.dart';
import '../../utils/image_constant.dart';
import '../widgets/back_card.dart';
import '../widgets/circularindicaror.dart';
import '../widgets/custom_checkbox_button.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_image_view.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/map_popop.dart';

class SignUpSendOTP extends StatefulWidget {
  String? number;
  String? otp;
  bool? signUp = false;
  bool? isParent = false;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? modeOfMode;
  String? city;
  String? referral;

  SignUpSendOTP(
      {super.key,
      this.number,
      this.otp,
      this.signUp,
      this.gender,
      this.modeOfMode,
      this.city,
      this.referral,
      this.lastName,
      this.firstName,
      this.email,
      this.isParent});

  @override
  State<SignUpSendOTP> createState() => _SignUpSendOTPState();
}

class _SignUpSendOTPState extends State<SignUpSendOTP> {
  late CityController _cityController;
  late FocusNode myFocusNode;

  late FocusNode fname;
  late FocusNode lname;
  late FocusNode refer;
  late FocusNode email;
  late FocusNode submit;
  @override
  void initState() {
    fname = FocusNode();
    lname = FocusNode();
    refer = FocusNode();
    email = FocusNode();
    submit = FocusNode();
    myFocusNode = FocusNode();
    // _cityController.getStateDetails().then((value) {
    //   setState(() {});
    // });
    _cityController = Get.put(CityController());
    _requestLocationPermission();
    // TODO: implement initState
    super.initState();
  }

  final AuthController apiController = Get.put(AuthController());
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController referralCodeController = TextEditingController();

  TextEditingController tuitionModeController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  // Rx<SignupModel> signupModelObj = SignupModel().obs;
  TextEditingController otpController = TextEditingController();

  bool iConfirmThatImYearsOldAndAbove = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final MyController myController = Get.put(MyController());
  final UserTypeController userTypeController = Get.find();

  @override
  void dispose() {
    fname.dispose();
    lname.dispose();
    refer.dispose();
    email.dispose();
    submit.dispose();
    myFocusNode.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    cityController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  List<SelectionPopupModel> lsitOfMode = [
    SelectionPopupModel(
      id: 1,
      title: "Online",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2, // Change this value to make it unique
      title: "Offline",
    ),
    SelectionPopupModel(
      id: 3, // Change this value to make it unique
      title: "Online/Offline",
    ),
  ];
  TextEditingController stateController = TextEditingController();
  List<SelectionPopupModel> listOfCities = [
    SelectionPopupModel(
      id: 1,
      title: "Mumbai",
      // state: "Maharashtra",
    ),
    SelectionPopupModel(
      id: 2,
      title: "Delhi",
      // state: "Delhi",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Bengaluru",
      // state: "Karnataka",
    ),
    SelectionPopupModel(
      id: 4,
      title: "Ahmedabad",
      // state: "Gujarat",
    ),
    SelectionPopupModel(
      id: 5,
      title: "Hyderabad",
      // state: "Telangana",
    ),
    SelectionPopupModel(
      id: 6,
      title: "Chennai",
      // state: "Tamil Nadu",
    ),
    SelectionPopupModel(
      id: 7,
      title: "Kolkata",
      // state: "West Bengal",
    ),
    SelectionPopupModel(
      id: 8,
      title: "Pune",
      // state: "Maharashtra",
    ),
    SelectionPopupModel(
      id: 9,
      title: "Jaipur",
      // state: "Rajasthan",
    ),
    SelectionPopupModel(
      id: 10,
      title: "Surat",
      // state: "Gujarat",
    ),
  ];
  LatLng? _selectedLocation;
  Future<void> _requestLocationPermission() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
  }

  Future<void> _openLocationPicker(BuildContext context) async {
    if (await Permission.location.isGranted) {
      LatLng? selectedLocation = await showDialog<LatLng>(
        context: context,
        builder: (BuildContext context) {
          return MapSelectionPopup();
        },
      );

      if (selectedLocation != null) {
        setState(() {
          _selectedLocation = selectedLocation;
        });
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 60.h.verticalSpace,
                  SizedBox(
                    // height: 467.w,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  // right: 0,
                                  child:backCard(context),
                                ),
                                Column(
                                  children: [
                                    90.h.verticalSpace,
                                    _buildFirstName1(widget.number),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        // height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => _buildSendOTP()),
            SizedBox(height: 22.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: GestureDetector(
                onTap: () {
                  Get.offAll(LoginMobileScreen());
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: CustomTextStyles.bodyMediumff000000,
                      ),
                      TextSpan(
                        text: "Sign In",
                        style: CustomTextStyles.titleSmallInterff00c1ff,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFirstName() {
    return CustomTextFormField(
      onFieldSubmitted: (term){
        fname.unfocus();
        FocusScope.of(context).requestFocus(lname);
      },
      focusNode: fname,
      textInputAction: TextInputAction.next,
      controller: firstNameController,
      hintText: "Your first name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter Your first name";
        }
        return null;
      },
    );
  }

  Widget _buildLastName() {
    return CustomTextFormField(
      controller: lastNameController,
      onFieldSubmitted: (term){
        lname.unfocus();
        FocusScope.of(context).requestFocus(email);
      },
      focusNode: lname,
      hintText: "Last name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Last name";
        }
        return null;
      },
    );
  }

  Widget _buildEmail() {
    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).unfocus();
      },
      child: CustomTextFormField(
        focusNode: email,
        onFieldSubmitted: (term){
          email.unfocus();
          FocusScope.of(context).requestFocus(refer);
        },
        textCapitalization: TextCapitalization.none,
        controller: emailController,
        hintText: "Email address",
        textInputType: TextInputType.emailAddress,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(30.w, 11.h, 18.w, 10.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgLock,
            height: 24.h,
            width: 24.w,
            color: Color(0xFF00C2FF),
          ),
        ),
        suffixConstraints: BoxConstraints(
          maxHeight: 45.h,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter an email address';
          } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail.com$')
              .hasMatch(value)) {
            return 'Please enter a valid Gmail address';
          }
          return null; // Return null if the input is valid
        },
        contentPadding: EdgeInsets.only(
          left: 19.w,
          top: 15.h,
          bottom: 15.h,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildReferralCode() {
    return CustomTextFormField(
      onFieldSubmitted: (term){
        refer.unfocus();
        FocusScope.of(context).requestFocus(submit);
      },
      focusNode: refer,
      textInputAction: TextInputAction.done,
      controller: referralCodeController,
      hintText: "Referral code (Optional)",
    );
  }

  /// Section Widget
  Widget _buildFirstName1(String? number) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: 11.w,
          right: 11.w,
          bottom: 40.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sign up as ",
                    style: CustomTextStyles.titleMediumff000000Bold_1,
                  ),
                  TextSpan(
                    text: "Tutor!",
                    style: CustomTextStyles.titleMediumff00c1ffBold_1,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 9.h),
            Container(
              margin: EdgeInsets.only(right: 39.w),
              child: Text(
                "We’ve sent you an 6 digit OTP on +91-${number}",
                style: CustomTextStyles.titleSmallBlack900_1,
              ),
            ),
            SizedBox(height: 15.h),
            _buildFirstName(),
            SizedBox(height: 15.h),
            _buildLastName(),
            SizedBox(height: 17.h),
            _buildEmail(),
            SizedBox(height: 15.h),
            _buildReferralCode(),
            SizedBox(height: 15.h),
            _buildLastSelectLocation(),
            SizedBox(height: 15.h),
            Obx(() {
              return Column(
                children: [
                  CustomDropDown(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your Mode of Tuition';
                      }
                      return null;
                    },
                    hintText: "Mode of Tuition",
                    items: lsitOfMode,
                    onChanged: (value) {
                      setState(() {
                        tuitionModeController.text = value.title.toString();
                      });
                    },
                  ),
                  SizedBox(height: 14.h),
                  CustomDropDown(
                    sub:true,
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your State';
                      }
                      return null;
                    },
                    hintText: "Select State",
                    items: _cityController.stateList.toList(),
                    // Use toList() to convert to a List<SelectionPopupModel>
                    onChanged: (SelectionPopupModel value) {
                      setState(() {
                        _cityController.getCityDetails(id: value.id);
                        stateController.text = value.title.toString();
                        cityController.text = ''; // City selection clear
                        _cityController.cityList.clear();
                        print(stateController.text);
                      });
                    },
                  ),
                  if (_cityController.cityList.isNotEmpty)
                    SizedBox(height: 14.h),
                  if (_cityController.cityList.isNotEmpty)
                    CustomDropDown(
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your city';
                        }
                        return null;
                      },
                      hintText: "Select your City",
                      items: _cityController.cityList.toList(),
                      onChanged: (value) {
                        setState(() {
                          cityController.text = value.title.toString();
                        });
                      },
                    )
                ],
              );
            }),
            SizedBox(height: 18.h),
            // CustomPinCodeTextField(
            //   context: context,
            //   onChanged: (p0) {
            //     setState(() {
            //       otpController.text = p0;
            //     });
            //   },
            // ),
            // SizedBox(height: 18.h),
            _buildIConfirmThatImYearsOldAndAbove(),
          ],
        ),
      ),
    );
  }

  Widget _buildIConfirmThatImYearsOldAndAbove() {
    return CustomCheckboxButton(
      decoration: const BoxDecoration(
          // color: Colors.white
          ),
      text: "I confirm that I'm 18 years old and above!",
      value: iConfirmThatImYearsOldAndAbove,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      onChange: (value) {
        setState(() {
          iConfirmThatImYearsOldAndAbove = value;
        });
      },
    );
    // );
  }

  Widget _buildSendOTP() {
    return myController.isIndicatorVisible.value
        ? SizedBox(
            height: 30, child: Center(child: MyCircularProgressIndicator()))
        : CustomElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                
                myController.showCircularProgress();
                apiController
                    .sendOtp(contactNo: widget.number.toString(), newUser: true)
                    .then((value) {
                  print(value);
                  if (value["is_error"] == false) {
                    if (value['isNewUser'] == true) {
                      Fluttertoast.showToast(msg: "OTP Sent");
                      Get.to(() => OtpLoginScreen(
                            number: widget.number,
                            signUp: true,
                            state: stateController.text,
                            location: _selectedLocation.toString(),
                            isParent: false,
                            email: emailController.text,
                            city: cityController.text,
                            referral: referralCodeController.text,
                            modeOfMode: tuitionModeController.text,
                            lastName: lastNameController.text,
                            firstName: firstNameController.text,
                          ));
                      myController.hideCircularProgress();
                    } else {
                      Fluttertoast.showToast(msg: "OTP Sent");
                      myController.hideCircularProgress();
                      // Get.to(() => SignUpSendOTP(
                      //       number: textEditingController.text,
                      //       otp: "1111",
                      //     ));
                    }
                  } else {
                    Get.snackbar("Warning", '${value["message"]}');
                    Future.delayed(const Duration(seconds: 1)).then((value) {
                      myController.hideCircularProgress();
                    });
                    print(value);
                  }
                });
                // apiController.registerDriver(
                //   mobile: widget.number,
                //   email: emailController.text,
                //   otp: otpController.text,
                //   first_name: firstNameController.text,
                //   last_name: lastNameController.text,
                //   referral_code: referralCodeController.text,
                //   city: cityController.text,

                //   mode_of_tution: tuitionModeController.text
                // ).then((value) {
                //   print("Response: $value");
                //   if (value["is_error"] == false) {
                //     Fluttertoast.showToast(msg:"Signup Successfully");
                //     SharedPref.accessToken =
                //         value['access_token'].toString();
                //     SharedPref.setStringSp(
                //       SharedPref.SP_KEY_ACCESS_TOKEN,
                //       value["access_token"].toString(),
                //     );
                //     SharedPref.setBoolSp(
                //       SharedPref.SP_KEY_IS_LOGGED_IN,
                //       true,
                //     );
                //    Get.offAll(()=>FirstOverView_Screen());
                //   }else {
                //     Fluttertoast.showToast(msg:"Something Went Wrong");
                //   }
                // }).catchError((error) {
                //   // Handle error if API call fails
                //   print("Error: $error");
                //   // Show a toast message for error
                //   Fluttertoast.showToast(msg: "Failed to verify OTP");
                // });
                // Get.to(OtpLoginScreen(signUp:true));
              } else {
                Future.delayed(const Duration(seconds: 1)).then((value) {
                  myController.hideCircularProgress();
                });
              }
            },

            // text: "Send OTP",
            text: "Sign Up",
            margin: EdgeInsets.symmetric(horizontal: 11.w),
            // buttonStyle: CustomButtonStyles.none,
            decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
            alignment: Alignment.center,
          );
  }

  Widget _buildLastSelectLocation() {
    return CustomTextFormField(
      suffix: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Icon(
          Icons.location_on_outlined,
          color: Color(0xFF00C2FF),
          size: 25,
        ),
      ),
      onTap: () => _openLocationPicker(context),
      // controller: lastNameController,
      readOnly: true,
      hintText: "Select Location",
      validator: (value) {
        // if (!isText(value)) {
        //   return "err_msg_please_enter_valid_text".tr;
        // }
        return null;
      },
    );
  }
}
