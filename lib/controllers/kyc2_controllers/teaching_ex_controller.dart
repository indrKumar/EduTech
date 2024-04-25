import 'dart:convert';

import 'package:edushalaacademy/models/experience_list_modele.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/experience_details_model.dart';
import '../../utils/store_local_data.dart';

class TeachingEx_Controller extends GetxController {
  Future<dynamic> addTeachingEx(
      {type,
      name,
      designation,
      start_year,
      end_year,
      duration,
      working,
      classes,
      board,
      subjects,
      about}) async {
    // if (name.toString().isEmpty || email.toString().isEmpty) {
    // Return an empty map if the contact number is invalid
    // return {};
    // }
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/exp/");

    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}',
      'Content-Type': 'application/json'
    };
    var body = json.encode({
      "type": type,
      "name": name,
      "designation": designation,
      // if(start_year.toString().isNotEmpty)"start_year": start_year,
      // if(end_year.toString().isNotEmpty)"end_year": end_year,
      "start_year": start_year,
      "end_year": end_year,
      "duration": duration,
      "working": working,
      "classes": classes,
      "board": board,
      "subjects": subjects,
      "about": about
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

  Future<dynamic> editTeachingEx(
      {type,
      id,
      name,
      designation,
      start_year,
      end_year,
      duration,
      working,
      classes,
      board,
      subjects,
      about}) async {
    // if (name.toString().isEmpty || email.toString().isEmpty) {
    // Return an empty map if the contact number is invalid
    // return {};
    // }
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/exp/");

    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}',
      'Content-Type': 'application/json'
    };
    var body = json.encode({
      "id": id,
      "type": type,
      "name": name,
      "designation": designation,
      "start_year": start_year,
      "end_year": end_year,
      "duration": duration,
      "working": working,
      "classes": classes,
      "board": board,
      "subjects": subjects,
      "about": about
    });
    if (kDebugMode) {
      print(body);
    }
    try {
      var response = await http.put(
        url,
        headers: headers,
        body: body,
      );
      if (kDebugMode) {
        print(body);
      }
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(data);
        } // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        if (kDebugMode) {
          print(data);
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

  RxList<TeachingExperience> eduQualificationsDetails =
      <TeachingExperience>[].obs;

  Future<TeachingExperience> getTeachingExDetails({required int id}) async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/exp/?id=$id");

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['is_error'] != null && !data['is_error']) {
          var teachingExperience = TeachingExperience.fromJson(data['data']);
          return teachingExperience;
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
    // Return a default value if an error occurs
    return TeachingExperience(
      id: 0,
      type: '',
      name: '',
      designation: '',
      duration: '',
      working: false,
      classes: '',
      board: '',
      subjects: '',
      about: '',
    );
  }

  RxList<ExperienceList> experienceData = <ExperienceList>[].obs;

  Future<void> experienceList() async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/exp/");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<ExperienceList> qualifications = List<ExperienceList>.from(
            data['data'].map((item) => ExperienceList.fromJson(item)));
        if (kDebugMode) {
          print(qualifications);
        }
        experienceData.assignAll(qualifications);
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

  Future<dynamic> deleteExperience({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/exp/?id=$id");

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

  Future<dynamic> finalSubmitExperience({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/submitkyc?id=$id");

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
}
