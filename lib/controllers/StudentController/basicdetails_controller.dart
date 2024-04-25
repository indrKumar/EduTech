import 'dart:convert';

import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class BasicDetailsController extends GetxController{

  Future<dynamic> addBasicDetails({name,gender,schoolName,terms,time,dob,location,List<dynamic>? subjects}) async {
    try {
      var uri = Uri.parse("https://edushala.ablive.in/studentapi/student/");
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${SharedPref.accessToken}'
      };
      var request = http.Request('POST', uri);
      request.body = json.encode({
            "name": name,
            "gender": gender,
            "school_name": schoolName,
            "term": terms,
            "preferrd_time": time??"05:30 PM",
            "dob": dob,
            "location": location,
            "subjects": subjects
          });
      print(request.body);
      request.headers.addAll(headers);
      var response = await request.send();
      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var data = json.decode(responseBody);
        return data;
      } else {
        throw Exception('Failed to add basic details. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      return null; // or handle the error as needed
    }
  }

  // List<StudentModel> studentModels = []; // List to store fetched data

  Future<dynamic> fetchStudentList() async {
    var url = Uri.parse("https://edushala.ablive.in/studentapi/student/");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

        var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
        // if (data['is_error'] == false) {
        //   List<StudentModel> fetchedModels = []; // Temporary list to store fetched StudentModels
        //
        //   // Parse each student from the response and create StudentModel instances
        //   for (var studentJson in data['students']) {
        //     StudentModel studentModel = StudentModel.fromJson(studentJson);
        //     fetchedModels.add(studentModel);
        //   }
        //
        //   // Assign fetched models to the main list
        //   // studentModels = fetchedModels;
        //
        //   // Use studentModels as needed
        //   for (var studentModel in studentModels) {
        //     for (var student in studentModel.students) {
        //       print('Student ID: ${student.id}, Name: ${student.name}');
        //     }
        //   }
        // } else {
        //   print('Error: ${data['message']}');
        // }
        return data;
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        return data;
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
  Future<dynamic> deleteCat({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/studentapi/student/?id=$id");

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
        print('Error: ${response.statusCode}');
        return data;
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }



}