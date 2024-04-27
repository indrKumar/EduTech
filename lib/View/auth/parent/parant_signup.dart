import 'package:edushalaacademy/View/auth/confirm_otp.dart';
import 'package:edushalaacademy/View/auth/loging_send.dart';
import 'package:edushalaacademy/View/widgets/custom_drop_down.dart';
import 'package:edushalaacademy/controllers/city_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../controllers/usertyep_controller.dart';
import '../../../models/dropdown_popup.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/back_card.dart';
import '../../widgets/custom_checkbox_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/map_popop.dart';

class ParentSignUpSendOTP extends StatefulWidget {
  String? number;
  String? otp;

  ParentSignUpSendOTP({super.key, this.number, this.otp});

  @override
  State<ParentSignUpSendOTP> createState() => _ParentSignUpSendOTPState();
}

class _ParentSignUpSendOTPState extends State<ParentSignUpSendOTP> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController referralCodeController = TextEditingController();

  TextEditingController tuitionModeController = TextEditingController();
  TextEditingController selectGenderController = TextEditingController();

  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // Rx<SignupModel> signupModelObj = SignupModel().obs;
  TextEditingController otpController = TextEditingController();

  bool iConfirmThatImYearsOldAndAbove = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController apiController = Get.put(AuthController());
  final CityController _cityController = Get.put(CityController());
  final MyController myController = Get.put(MyController());
  final UserTypeController userTypeController = Get.find();
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
  ];
  List<SelectionPopupModel> listOfGender = [
    SelectionPopupModel(
      id: 1,
      title: "Male",
      // isSelected: true,
    ),
    SelectionPopupModel(
      id: 2, // Change this value to make it unique
      title: "Female",
    ),
  ];
  LatLng? _selectedLocation;

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
    _requestLocationPermission();
    super.initState();
  }

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
          locationController.text = selectedLocation.toString();
        });
      }
    } else {
      // Handle the case when the permission is not granted
      // You can show a message to the user or request the permission again
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                              if (_selectedLocation != null)
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    'Selected Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    90.h.verticalSpace,
                                    _buildFirstName1(widget.number),
                                  ],
                                ),
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
      bottomNavigationBar: SizedBox(
        // height: 40,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSendOTP(),
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

  Widget _buildFirstName() {
    return CustomTextFormField(
      onFieldSubmitted: (term){
        fname.unfocus();
        FocusScope.of(context).requestFocus(lname);
      },
      focusNode: fname,
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
      onFieldSubmitted: (term){
        lname.unfocus();
        FocusScope.of(context).requestFocus(email);
      },
      focusNode: lname,
      controller: lastNameController,
      hintText: "Last name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Last name";
        }
        return null;
      },
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

  Widget _buildEmail() {
    return GestureDetector(
      onTap: () {
        // FocusScope.of(context).unfocus();
      },
      child: CustomTextFormField(
        textCapitalization: TextCapitalization.none,
        focusNode: email,
        onFieldSubmitted: (term){
          email.unfocus();
          FocusScope.of(context).requestFocus(refer);
        },
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

  Widget _buildReferralCode() {
    return CustomTextFormField(
      onFieldSubmitted: (term){
        refer.unfocus();
        FocusScope.of(context).requestFocus(submit);
      },
      autofocus: false,
      focusNode: refer,
      textInputAction: TextInputAction.done,
      controller: referralCodeController,
      hintText: "Referral code (Optional)",
    );
  }

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

  Widget _buildFirstName1(String? number) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
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
                    text: "Parent/Student!",
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
            SizedBox(height: 15.h),
            CustomDropDown(
              validator: (value) {
                if (value == null) {
                  return 'Please select your gender';
                }
                return null;
              },
              hintText: "Gender",
              items: listOfGender,
              onChanged: (value) {
                setState(() {
                  selectGenderController.text = value.title.toString();
                });
              },
            ),

            SizedBox(height: 17.h),
            _buildEmail(),
            SizedBox(height: 15.h),
            _buildReferralCode(),
            SizedBox(height: 15.h),
            _buildLastSelectLocation(),
            SizedBox(height: 15.h),
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
            Obx(() {
              return Column(
                children: [
                  SizedBox(height: 14.h),
                  CustomDropDown(
                    sub: true,
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
            // SizedBox(height: 18.h),
            // CustomPinCodeTextField(
            //   context: context,
            //   onChanged: (p0) {
            //     setState(() {
            //       otpController.text = p0;
            //     });
            //   },
            // ),
            SizedBox(height: 18.h),
            _buildIConfirmThatImYearsOldAndAbove(),
          ],
        ),
      ),
    );
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  /// Section Widget
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

  /// Section Widget
  Widget _buildSendOTP() {
    return CustomElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          myController.showCircularProgress();
          apiController
              .sendStudentOtp(contactNo: widget.number, newUser: true)
              .then((value) {
            print(value);
            if (value["is_error"] == false) {
              if (value['isNewUser'] == true) {
                Fluttertoast.showToast(msg: "OTP Sent");
                Get.to(() => OtpLoginScreen(
                      location: _selectedLocation.toString(),
                      signUp: true,
                      state: stateController.text,
                      email: emailController.text,
                      gender: selectGenderController.text,
                      city: cityController.text,
                      number: widget.number,
                      firstName: firstNameController.text,
                      isParent: true,
                      lastName: lastNameController.text,
                      modeOfMode: tuitionModeController.text,
                      referral: referralCodeController.text,
                    ));
                myController.hideCircularProgress();
              } else {
                Fluttertoast.showToast(msg: "OTP Not send");
                myController.hideCircularProgress();
                // Get.to(()=>SignUpSendOTP(number: textEditingController.text,
                //   otp: "1111",
                // ));
              }
              // Show a toast message for successful OTP sent

              // Navigate to OtpLoginScreen after OTP is sent
            } else {
              // Show snackbar for invalid phone number
              Get.snackbar("Warning", '${value["message"]}');
              Future.delayed(const Duration(seconds: 1)).then((value) {
                myController.hideCircularProgress();
              });
              print(value);
            }
          });
        } else {
          Future.delayed(const Duration(seconds: 1)).then((value) {
            myController.hideCircularProgress();
          });
        }
      },
      // },
      // text: "Send OTP",
      text: "Sign Up",
      margin: EdgeInsets.symmetric(horizontal: 11.w),
      // buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
      alignment: Alignment.center,
    );
  }
}
