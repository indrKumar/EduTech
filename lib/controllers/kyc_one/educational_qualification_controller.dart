import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/educualification_model.dart';
import '../../utils/store_local_data.dart';
import 'education_details.dart';

class EducationController extends GetxController {

  RxList<EduQualification> eduQualifications = <EduQualification>[].obs;

  Future<dynamic> submitKycStatus({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/submitkyc?id=$id");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
  }
  Future<dynamic> addNewQualification({
    className,
    board,
    medium,
    studying,
    institutionName,
    percentage,
    year,
    imagePath,
  }) async {
    var headers = {
      'Authorization':
          'Bearer ${SharedPref.accessToken}',
      // 'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://edushala.ablive.in/tutorapi/eduqual/'),
    );
    request.headers.addAll(headers);

    if (kDebugMode) {
      print(
        {
      "qname": className.toString(),
      "board": board,
      "medium": medium,
      "studying": studying.toString(),
      "institutionName": institutionName,
      "completedYear": year,
      "percentage": percentage,
    });
    }
    request.fields.addAll({
    "qname": className,
    "board": board,
    "medium": medium,
    "studying": studying.toString(),
    "institutionName": institutionName,
    "completedYear": year,
    "percentage": percentage,
    });
    // 'qname': 'Metric',
    // 'board': 'CBSE',
    // 'medium': ' English',
    // 'institutionName': ' DAV Rajrappa',
    // 'completedYear': ' 2018',
    // 'percentage': ' 89.5'

    // Add image file to the request if imagePath is not null
    if (imagePath != null && File(imagePath.toString()).existsSync()) {
      var imageFile = await http.MultipartFile.fromPath('marksheet', imagePath.toString());
      request.files.add(imageFile);
    } else {
      if (kDebugMode) {
        print('Error: Image file does not exist at the specified path.');
      }
    }

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (kDebugMode) {
          print(data);
        }
        return data;
      } else {
        if (kDebugMode) {
          print(data);
        print('Failed to add new qualification. Status Code: ${response.statusCode}');
        }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return {};
    }
  }

  Future<dynamic> editNewQualification({
    className,
    board,
    medium,
    studying,
    institutionName,
    percentage,
    year,
    imagePath,
    id
  }) async {
    var headers = {
      'Authorization':
      'Bearer ${SharedPref.accessToken}'
      // '${SharedPref.accessToken}'
          '',
      'Content-Type': 'application/json'
    };

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://edushala.ablive.in/tutorapi/eduqual/'),
    );
    request.headers.addAll(headers);
    if (kDebugMode) {
      print({
      "qname": className.toString(),
      "board": board,
      "medium": medium,
      "studying": studying.toString(),
      "institutionName": institutionName,
      "completedYear": year,
      "percentage": percentage,
    });
    }
    request.fields.addAll({
      "id":id,
      "qname": className,
      "board": board,
      "medium": medium,
      "studying": studying.toString(),
      "institutionName": institutionName,
      "completedYear": year,
      "percentage": percentage,
    });
    // 'qname': 'Metric',
    // 'board': 'CBSE',
    // 'medium': ' English',
    // 'institutionName': ' DAV Rajrappa',
    // 'completedYear': ' 2018',
    // 'percentage': ' 89.5'

    // Add image file to the request if imagePath is not null
    if (imagePath != null && File(imagePath.toString()).existsSync()) {
      var imageFile = await http.MultipartFile.fromPath('marksheet', imagePath.toString());
      request.files.add(imageFile);
    } else {
      if (kDebugMode) {
        print('Error: Image file does not exist at the specified path.');
      }
    }

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        if (kDebugMode) {
          print(data);
        }
        return data;
      } else {
        if (kDebugMode) {
          print(data);
        print(
            'Failed to add new qualification. Status Code: ${response.statusCode}');
        }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      return {};
    }
  }
  Future<void> educationList() async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/eduqual/");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<EduQualification> qualifications = List<EduQualification>.from(
            data['data'].map((item) => EduQualification.fromJson(item)));
        if (kDebugMode) {
          print(qualifications);
        }
        eduQualifications.assignAll(qualifications);
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
  }
  Future<dynamic> deleteEducation({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/eduqual/?id=$id");

    try {
      var response = await http.delete(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},

        // headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data;
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
        return data;
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
  }

  var eduQualificationsDetails = <EduQualificationDetails>[];


  Future<void> getEducationDetails({id}) async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/eduqual?id=$id");

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['is_error'] != null && !data['is_error']) {
          var eduQualificationDetails = EduQualificationDetails.fromJson(data['data']);
          eduQualificationsDetails.add(eduQualificationDetails);
        } else {
          if (kDebugMode) {
            print('Error message: ${data['message']}');
          }
        }
      } else {
        if (kDebugMode) {
          print('Error: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
    }
  }
}
