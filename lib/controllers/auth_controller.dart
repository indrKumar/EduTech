import 'dart:async';
import 'dart:convert';

import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_url.dart';

class AuthController extends GetxController {
  Future<dynamic> sendOtp({String? contactNo, newUser}) async {
    if (kDebugMode) {
      print(contactNo);
    }
    if (contactNo?.length != 10) {
      // Return an error message if the contact number is invalid
      return {"is_error": true, "message": "Please enter a valid number."};
    }

    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse(AppUrl.sendOTPUrl);
    var body = jsonEncode({"mobile": contactNo, "newUser": newUser});

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // If the request is successful, return the response data
        if (kDebugMode) {
          print(data);
        }
        return data;
      } else {
        // If the request fails, handle the error based on the status code
        if (kDebugMode) {
          print('Failed to send OTP. Status Code: ${response.statusCode}');
        }
        // Return the error message
        return {
          "is_error": true,
          "message": "Failed to send OTP. Please try again later."
        };
      }
    } catch (e) {
      // If an error occurs during the request, catch it and return an error message
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return {
        "is_error": true,
        "message": "An error occurred. Please try again later."
      };
    }
  }

  Future<dynamic> sendStudentOtp({String? contactNo, newUser}) async {
    if (kDebugMode) {
      print(newUser);
    }
    if (contactNo?.length != 10) {
      // Return an error message if the contact number is invalid
      return {"is_error": true, "message": "Please enter a valid number."};
    }

    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse("https://edushala.ablive.in/studentapi/getotp/");
    var body = jsonEncode({"mobile": contactNo, "newUser": newUser});

    try {
      if (kDebugMode) {
        print(url);
      }
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // If the request is successful, return the response data
        if (kDebugMode) {
          print(data);
        }
        return data;
      } else {
        // If the request fails, handle the error based on the status code
        if (kDebugMode) {
          print('Failed to send OTP. Status Code: ${response.statusCode}');
        }
        // Return the error message
        return {
          "is_error": true,
          "message": "Failed to send OTP. Please try again later."
        };
      }
    } catch (e) {
      // If an error occurs during the request, catch it and return an error message
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return {
        "is_error": true,
        "message": "An error occurred. Please try again later."
      };
    }
  }

  Future<dynamic> verifyOTP({String? contactNo, String? otp}) async {
    // Check if the OTP length is valid
    if (otp == null || otp.length != 4) {
      return {"is_error": true, "message": "Please enter a valid OTP."};
    }

    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/verifyotp/");
    var body = json.encode({"mobile": contactNo, "otp": otp});

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (kDebugMode) {
        print(body);
      }
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        } // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        if (kDebugMode) {
          print('Failed to verify OTP. Status Code: ${response.statusCode}');
        }
        // Return an empty map if the request fails
        return {};
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Return an empty map if an error occurs
      return {};
    }
  }

  Future<dynamic> registerDriver(
      {mobile,
      otp,
      first_name,
      state,
      last_name,
      email,
      mode_of_tution,
      location,
      city,
      referral_code}) async {
    // if (name.toString().isEmpty || email.toString().isEmpty) {
    // Return an empty map if the contact number is invalid
    // return {};
    // }
    var url = Uri.parse(AppUrl.registerUser);

    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "mobile": mobile,
      "otp": otp,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "mode_of_tution": mode_of_tution,
      "state": state,
      "location": location ?? '',
      "city": city,
      "referral_code": referral_code
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (kDebugMode) {
        print(body);
      }
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        } // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        if (kDebugMode) {
          print('Failed to  Status Code: ${response.statusCode}');
        }
        // Return an empty map if the request fails
        return {};
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Return an empty map if an error occurs
      return {};
    }
  }

  Future<dynamic> verifyOTPParent({String? contactNo, String? otp}) async {
    // Check if the OTP length is valid
    if (otp == null || otp.length != 4) {
      return {"is_error": true, "message": "Please enter a valid OTP."};
    }

    var headers = {'Content-Type': 'application/json'};
    var url = Uri.parse("https://edushala.ablive.in/studentapi/login/");
    var body = json.encode({"mobile": contactNo, "otp": otp});

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      // print(body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        } // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        if (kDebugMode) {
          print('Failed to verify OTP. Status Code: ${response.statusCode}');
        }
        // Return an empty map if the request fails
        return {};
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Return an empty map if an error occurs
      return {};
    }
  }

  Future<dynamic> registerParent(
      {mobile,
      otp,
      first_name,
      last_name,
      location,
      email,
      mode_of_tution,
      state,
      gender,
      city,
      referral_code}) async {
    if (kDebugMode) {
    print("objectsdssds");
      print({
      "mobile": mobile,
      "otp": otp,
      "gender": gender,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "mode_of_tution": mode_of_tution,
      "location": location ?? '',
      "city": city,
      "state": state,
      "referral_code": referral_code
    });
    }
    // if (name.toString().isEmpty || email.toString().isEmpty) {
    // Return an empty map if the contact number is invalid
    // return {};
    // }
    var url = Uri.parse("https://edushala.ablive.in/studentapi/signup/");

    if (kDebugMode) {
      print({
      "mobile": mobile,
      "otp": otp,
      "gender": gender,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "mode_of_tution": mode_of_tution,
      "state": state,
      "location": location ?? '',
      "city": city,
      "referral_code": referral_code
    });
    }
    var headers = {'Content-Type': 'application/json'};
    var body = json.encode({
      "mobile": mobile,
      "otp": otp,
      "gender": gender,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "mode_of_tution": mode_of_tution,
      "state": state,
      "location": location ?? '',
      "city": city,
      "referral_code": referral_code
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      if (kDebugMode) {
        print(body);
      }
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (kDebugMode) {
          print(data);
        } // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        if (kDebugMode) {
          print('Failed to  Status Code: ${response.statusCode}');
        }
        // Return an empty map if the request fails
        return {};
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Return an empty map if an error occurs
      return {};
    }
  }

  // Future<dynamic> uploadImage({String? docType, File? file}) async {
  //   if (docType == null || file == null) {
  //     return null; // Handle null parameters
  //   }
  //
  //   try {
  //     var headers = {
  //       'Authorization': "Bearer ${Shar.accessToken}",
  //     };
  //
  //     var request = http.MultipartRequest('POST', Uri.parse(AppUrl.uploadDocument));
  //     request.headers.addAll(headers);
  //     request.fields['document_type'] = docType;
  //
  //     // Convert the file to bytes and create a MultipartFile from it
  //     List<int> fileBytes = await file.readAsBytes();
  //     http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
  //       'front_img',
  //       fileBytes,
  //       filename: file.path.split('/').last, // Use the file name as the filename
  //     );
  //     request.files.add(multipartFile);
  //
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       String responseBody = await response.stream.bytesToString();
  //       return json.decode(responseBody);
  //     } else {
  //       print(response.reasonPhrase);
  //       return null; // Handle unsuccessful response
  //     }
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //     return null; // Handle errors
  //   }
  // }


  static Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPref.SP_KEY_REFRESH_TOKEN) ?? '';
  }


   Future<void> refreshAccessToken() async {

    try {
      String refreshToken = await getRefreshToken();
      var headers = {
        'Content-Type': 'application/json',
      };
      var response = await http.post(
        Uri.parse('https://edushala.ablive.in/refresh/'),
        headers: headers,
        body: json.encode({
          "refresh": refreshToken,
        }),
      );

      // await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      // await Future.delayed(Duration.zero); // Ensure the app is fully closed before restarting
      // await SystemChannels.platform.invokeMethod('SystemNavigator.push');
      if (response.statusCode == 200) {
        var newAccessToken = json.decode(response.body)['access'];
        var newRefreshToken = json.decode(response.body)['refresh'];
        await SharedPref.setStringSp(SharedPref.SP_KEY_ACCESS_TOKEN,newAccessToken);
        await SharedPref.setStringSp(SharedPref.SP_KEY_REFRESH_TOKEN,newRefreshToken);
      } else {
        if (kDebugMode) {
          print('Failed to refresh access token: ${response.reasonPhrase}');
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Failed to refresh access token: $error');
      }
    }
  }

final start = 30.obs;
  Timer? _timer;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start.value--;
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
