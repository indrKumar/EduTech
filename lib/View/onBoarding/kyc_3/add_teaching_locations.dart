import 'package:edushalaacademy/View/onBoarding/kyc_step_1/kyc_spep_one.dart';
import 'package:edushalaacademy/View/widgets/circularindicaror.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../controllers/city_controller.dart';
import '../../../controllers/kyc_one/educational_qualification_controller.dart';
import '../../../controllers/kyc_one/teaching_controller.dart';
import '../../../controllers/manage_screen_controller.dart';
import '../../../models/dropdown_popup.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../utils/image_constant.dart';
import '../../widgets/custom_drop_down.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class TeachingLocationsScreen extends StatefulWidget {
  const TeachingLocationsScreen({super.key});

  @override
  State<TeachingLocationsScreen> createState() =>
      _TeachingLocationsScreenState();
}

class _TeachingLocationsScreenState extends State<TeachingLocationsScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TeachingController _teachingController = Get.put(TeachingController());
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  EducationController educationController = Get.put(EducationController());
  final CityController _cityController = Get.put(CityController());
  final MyController myController = Get.put(MyController());
  String? _currentAddress;
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
  Future<void> _requestLocationPermission() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
  }
  @override
  void initState() {
    _requestLocationPermission();
    _cityController.getCityDetails().then((value) {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    locationController.dispose();
    landMarkController.dispose();
    address2Controller.dispose();
    address1Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    // TODO: implement dispose
    super.dispose();
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
              horizontal: 19.h,
              vertical: 41.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30.w),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Add ",
                        style: CustomTextStyles.titleMediumcc000000,
                      ),
                      TextSpan(
                        text: "Teaching Location",
                        style: CustomTextStyles.titleMediumff00c1ffBold,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 7.w),
                Container(
                  margin: EdgeInsets.only(right: 24.h),
                  child: Text(
                    "You can choose one category at a time. If you want to choose more than one category, first complete the details of one selected category. ",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 13.w),
                _buildTime(),
                SizedBox(height: 15.w),
                _buildAddress(),
                SizedBox(height: 15.w),
                _buildLandmarkvalue(),
                SizedBox(height: 15.w),
                _buildPincode(),
                Obx(() {
                  return Column(
                    children: [
                      SizedBox(height: 15.h),
                      CustomDropDown(
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your State';
                          }
                          return null;
                        },
                        sub:true,
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
                // _buildCity(),
                SizedBox(height: 14.w),
                _buildGoogleOne(),
                SizedBox(height: 155.w),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: _buildBottomBar(),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  Widget _buildTime() {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address line w';
        }
        return null;
      },
      controller: address1Controller,
      hintText: "Address line 1",
    );
  }

  /// Section Widget
  Widget _buildAddress() {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Address line 2';
        }
        return null;
      },
      controller: address2Controller,
      hintText: "Address line 2",
    );
  }

  Widget _buildLandmarkvalue() {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Landmark';
        }
        return null;
      },
      controller: landMarkController,
      hintText: "Landmark",
    );
  }

  /// Section Widget
  Widget _buildPincode() {
    return CustomTextFormField(
      inputFormatter: LengthLimitingTextInputFormatter(6),
      controller: pinCodeController,
      hintText: "PIN code".tr,
      textInputType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty || value.length < 6) {
          return 'Please enter your valid pin code';
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildGoogleOne() {
    return CustomTextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please tap on select location';
        }
        return null;
      },
      onTap: () {
        // _getLocation();
        getLatLong();
        _determinePosition();
      },
      readOnly: true,
      controller: locationController,
      // controller: controller.googleOneController,
      hintText: "Locate on Google",
      textInputAction: TextInputAction.done,
      suffix: Container(
          margin: EdgeInsets.fromLTRB(30.h, 11.w, 16.h, 11.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.h,
            ),
          ),
          child: SvgPicture.asset(ImageConstant.imgGoogle1)),
      suffixConstraints: BoxConstraints(
        maxHeight: 45.w,
      ),
      contentPadding: EdgeInsets.only(
        left: 19.h,
        top: 15.w,
        bottom: 15.w,
      ),
    );
  }

  Widget _buildSubmit() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: myController.isIndicatorVisible.value
            ? SizedBox(
                height: 30, child: Center(child: MyCircularProgressIndicator()))
            : CustomElevatedButton(
                text: "Submit",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    myController.showCircularProgress();
                    _teachingController
                        .addTeachingLocation(
                            city: cityController.text,
                            state: stateController.text,
                            addressL1: address1Controller.text,
                            addressL2: address2Controller.text,
                            landmark: landMarkController.text,
                            lat: lat,
                            long: long,
                            pincode: pinCodeController.text)
                        .then((value) {
                      if (value != null) {
                        if (value["is_error"] == false) {
                          educationController
                              .submitKycStatus(id: 3)
                              .then((value) {
                            Get.offAll(() => const Kyc_Step_One_Screen());
                          });
                          myController.hideCircularProgress();
                          Fluttertoast.showToast(
                              msg: "Teaching location added successfully");
                          // Get.back();
                        } else {
                          Future.delayed(const Duration(seconds: 1))
                              .then((value) {
                            myController.hideCircularProgress();
                          });
                          Fluttertoast.showToast(msg: "Something went wrong");
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: value["message"].toString());
                        Future.delayed(const Duration(seconds: 1))
                            .then((value) {
                          myController.hideCircularProgress();
                        });
                      }
                      print(value);
                    });
                  } else {}

                  // Get.to(Kyc_Step_Four_Vidio());
                },
                // buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientPrimaryToBlueDecoration,
              ),
      ),
    );
  }

  // Future<void> _getLocation() async {
  //   Location location = Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   setState(() {
  //     _currentLocation = _locationData;
  //   });
  //
  //   print('Latitude: ${_currentLocation!.latitude}, Longitude: ${_currentLocation!.longitude},current $_currentLocation');
  // }

  double? lat;

  double? long;

  String address = "";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });
      print(value.latitude);

      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
  }

//For convert lat long to address
  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      locationController.text =
          "${placemarks[0].street}  ${placemarks[0].subLocality}  ${placemarks[0].locality}";
    });

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }
}
