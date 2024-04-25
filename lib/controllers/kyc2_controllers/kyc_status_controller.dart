import 'dart:convert';
import 'dart:io';

import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/applied_cat_model.dart';

class Kyc2StatusController extends GetxController {
  RxBool personalInformation = false.obs;
  RxBool teachingExperience = false.obs;
  RxBool virtualInterview = false.obs;
  RxList<AppliedCategory> appliedList = <AppliedCategory>[].obs;

  Future<void> fetchKycStatus() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://edushala.ablive.in/tutorapi/kyc2status/')
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      // Parse the response body into a Map
      Map<String, dynamic> data = json.decode(responseBody);
      if (kDebugMode) {
        print(data);
      }

      // Convert the list of data to a list of AppliedCategory objects
      List<AppliedCategory> categories = (data["Applied Category"] as List)

          .map((item) => AppliedCategory.fromJson(item))
          .toList();

      // Update appliedList with the converted list
      appliedList.assignAll(categories);

      // Update state variables with fetched data
      personalInformation.value = data['Personal Information'] ?? false;
      teachingExperience.value = data['Teaching Experience'] ?? false;
      virtualInterview.value = data['Virtual Interview'] ?? false;
    } else {
      if (kDebugMode) {
        print('Failed to fetch data: ${response.reasonPhrase}');
      }
    }
  }

  Future<dynamic> addPersonalDetails({
    dob,
    gender,
    aadhaar,
    pic,
    certificate,
    mobile,
    address,
    same_as_techingAddress,
  }) async {
    try {
      var url = Uri.parse("https://edushala.ablive.in/tutorapi/submitpi/");

      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}'
      };

      var request = http.MultipartRequest('POST', url);

      request.fields.addAll({
        'dob': dob.toString(),
        'gender': gender.toString(),
        'aadhaar': aadhaar.toString(),
        "mobile": mobile.toString(),
        "address": address.toString(),
        "same_as_techingAddress": same_as_techingAddress.toString()
      });
      if (kDebugMode) {
        print(request.fields);
      }
      if (certificate != null && File(certificate.toString()).existsSync()) {
        var imageFile = await http.MultipartFile.fromPath('certificate', certificate.toString());
        request.files.add(imageFile);
      } else {
        if (kDebugMode) {
          print('Error: Certificate file does not exist at the specified path.');
        }
      }

      if (pic != null && File(pic.toString()).existsSync()) {
        var imageFile = await http.MultipartFile.fromPath('pic', pic.toString());
        request.files.add(imageFile);
      } else {
        if (kDebugMode) {
          print('Error: Profile picture file does not exist at the specified path.');
        }
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = jsonDecode(await response.stream.bytesToString());
      if (kDebugMode) {
        print(data);
      }
      if (response.statusCode == 201) {
        return data;
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return data; // or handle the error accordingly
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return null; // or handle the error accordingly
    }
  }
RxString question = ''.obs;
  Future<void> getQuestion({id}) async {
    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}'
    };
    var request = http.Request(
        'GET', Uri.parse('https://edushala.ablive.in/tutorapi/cat_app/?id=$id')
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      // Parse the response body into a Map
      Map<String, dynamic> data = json.decode(responseBody);
      if (kDebugMode) {
        print(data);
      }
      // Convert the list of data to a list of AppliedCategory objects
       question?.value = (data["question"]??'');
    } else {
      if (kDebugMode) {
        print('Failed to fetch data: ${response.reasonPhrase}');
      }
    }
  }

  Future<dynamic> uploadQuestion({
    id,
    video,
  }) async {
    try {
      var url = Uri.parse("https://edushala.ablive.in/tutorapi/cat_app/");

      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}'
      };

      var request = http.MultipartRequest('POST', url);

      request.fields['id'] = id.toString();

      if (video != null) {
        var videoUri = Uri.file(video);
        var videoFile = File(videoUri.path);
        if (videoFile.existsSync()) {
          var fileSizeInBytes = videoFile.lengthSync();
          var fileSizeInKB = fileSizeInBytes / 1024; // Convert bytes to kilobytes
          var fileSizeInMB = fileSizeInKB / 1024; // Convert kilobytes to megabytes

          if (kDebugMode) {
            print('Video file: $videoUri');
          print('File size: $fileSizeInBytes bytes');
          print('File size: $fileSizeInKB KB');
          print('File size: $fileSizeInMB MB');
          }

          var videoMultipartFile = await http.MultipartFile.fromPath('answer', videoUri.path);
          request.files.add(videoMultipartFile);
        } else {
          if (kDebugMode) {
            print('Error: Video file does not exist at the specified path.');
          }
        }
      } else {
        if (kDebugMode) {
          print('Error: Video file path is null or invalid.');
        }
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          var data = jsonDecode(await response.stream.bytesToString());
          if (kDebugMode) {
            print(data);
          }
          return data;
        } else {
          if (kDebugMode) {
            print('Unexpected response format: HTML');
          }
          // Handle the unexpected response format here
          return null;
        }
      } else {
        if (kDebugMode) {
          print(response.reasonPhrase);
        }
        return null; // or handle the error accordingly
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return null; // or handle the error accordingly
    }
  }


}
