import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;
import '../../models/demo_model_st.dart';
import '../../models/inquiry_data_model.dart';
import '../../models/pakage_about_model.dart';
import '../../models/pakege_details.dart';
import '../../models/student_class_model.dart';
import '../../models/tutor_details_model.dart';
import '../../models/tutor_shortlisted_list_model.dart';
import '../../utils/store_local_data.dart';

class PackageDetails extends GetxController {
  RxList<PackageDetailList> packageDetails = <PackageDetailList>[].obs;
  RxBool isLoadingPay = false.obs;

  Future<void> packageList() async {
    var url = Uri.parse("https://edushala.ablive.in/studentapi/tutorlevel/");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['data'] != null && data['data'] is List) {
          List<PackageDetailList> qualifications = (data['data'] as List)
              .map((item) => PackageDetailList.fromJson(item))
              .toList();
          if (kDebugMode) {
            print(qualifications);
          }
          packageDetails.assignAll(qualifications);
        } else {
          if (kDebugMode) {
            print('Data is null or not in the expected format');
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

  RxList<PackageAboutModel> packageAboutDetails = <PackageAboutModel>[].obs;

  Future<void> getTeachingExDetails({required int id}) async {
    packageAboutDetails.value.clear();
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var url =
        Uri.parse("https://edushala.ablive.in/studentapi/tutorlevel/?id=$id");

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['is_error'] != null && !data['is_error']) {
          var packageAboutModel = PackageAboutModel.fromJson(data['data']);
          packageAboutDetails.add(packageAboutModel);
          if (kDebugMode) {
            print("Package about details for ID $id: $packageAboutModel");
          }
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

  Future<dynamic> createEnquiry(tutorLevel) async {
    isLoadingPay.value = true;
    var apiUrl = 'https://edushala.ablive.in/studentapi/enquiry/';
    var authToken = 'Bearer ${SharedPref.accessToken}';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': authToken,
    };

    var requestBody = json.encode({
      "tutor_level": tutorLevel,
    });

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: requestBody,
      );

      if (response.statusCode == 200) {
        isLoadingPay.value = false;
        return response.body;
      } else {
        Future.delayed(const Duration(seconds: 3)).then((value) {
          isLoadingPay.value = false;
        });
        return 'Error: ${response.reasonPhrase}';
      }
    } catch (e) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        isLoadingPay.value = false;
      });
      return 'Error: $e';
    }
  }

  var inquiryData = <InquiryDataModel>[].obs;

  Future<InquiryDataModel> fetchData() async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};

    var response = await http.get(
      Uri.parse('https://edushala.ablive.in/studentapi/enquiry/'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      return InquiryDataModel.fromJson(json.decode(response.body));
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      throw Exception('Failed to load data');
    }
  }

  var shortListedDataList = <Tutor>[].obs;

  Future<void> fetchShortListedDataList() async {
    shortListedDataList.value.clear();
    try {
      final response = await http.get(
        Uri.parse('https://edushala.ablive.in/studentapi/shtutor/'),
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['data'];
        List<Tutor> tutors = data.map((json) => Tutor.fromJson(json)).toList();
        shortListedDataList.value = tutors;
        print("Tutors loaded successfully");
      } else {
        print("Failed to load tutors - Status code: ${response.statusCode}");
        throw Exception('Failed to load tutors');
      }
    } catch (e) {
      print("Error fetching tutors: $e");
      throw Exception('Failed to load tutors');
    }
  }

  Future<Profile> fetchProfileDetails(
      {required int id}) async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};

    var response = await http.get(
      Uri.parse('https://edushala.ablive.in/studentapi/shtutor/?id=$id'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch profile: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> approveListedTutors({
    required int id,
    required String status,
    required String demoDate,
    required String demoTime,
  }) async {
    var uri = Uri.parse(
        'https://edushala.ablive.in/studentapi/shtutor/?id=$id&status=$status&demo_date=$demoDate&demo_time=$demoTime');

    var response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'Failed to fetch shortlisted tutors: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> rejectListedTutors({
    required int id,
    required String status,
    required String feedBAck,
  }) async {
    var uri = Uri.parse(
        'https://edushala.ablive.in/studentapi/shtutor/?id=$id&status=$status&feedback=$feedBAck');

    var response = await http.get(
      uri,
      headers: {'Authorization': "Bearer ${SharedPref.accessToken}"},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'Failed to fetch shortlisted tutors: ${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> approveTutorDemo({
    rejectOrApprove,
  }) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${SharedPref.accessToken}'
    };

    var uri = Uri.parse('https://edushala.ablive.in/studentapi/shtutor/');
    var response = await http.put(
      uri,
      headers: headers,
      body: json.encode({"demo": rejectOrApprove}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to approve tutor demo: ${response.reasonPhrase}');
    }
  }

  var responsePayMessage = ''.obs;

  Future<Map<String, dynamic>> paymentPay({
    rejectOrApprove,
  }) async {
    isLoadingPay.value = true;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${SharedPref.accessToken}'
    };

    var uri = Uri.parse('https://edushala.ablive.in/studentapi/enquiry/');
    var response = await http.put(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      isLoadingPay.value = false;
      return data;
    } else {
      Future.delayed(Duration(seconds: 3)).then((value) {
        isLoadingPay.value = false;
      });
      throw Exception('Failed to approve tutor demo: ${response.reasonPhrase}');
    }
  }

  Future<Meeting> fetchMeetingDetails() async {
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var response = await http.get(
        Uri.parse('https://edushala.ablive.in/studentapi/demo_class/'),
        headers: headers,
      );

      var jsonData = json.decode(response.body);
      if (response.statusCode == 200) {
        print(jsonData);
        return Meeting.fromJson(jsonData);
      } else {
        throw Exception('Failed to load meeting details');
      }
    } on SocketException catch (e) {
      // Handle socket exceptions
      print('Socket exception: $e');
      // You can throw a custom exception or return a default Meeting object
      throw Exception(
          'Failed to connect to the server. Please check your internet connection.');
    } on FormatException catch (e) {
      // Handle format exceptions
      print('Format exception: $e');
      throw Exception('Invalid data format received');
    } on Exception catch (e) {
      // Handle other generic exceptions
      print('Exception: $e');
      throw Exception('An error occurred while fetching meeting details');
    }
  }
   Future<List<StudentClassM>> fetchStudentData() async {
    var url = Uri.parse('https://edushala.ablive.in/studentapi/studentclass/?student_id=227&type=Demo');
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0MTEyOTkzLCJpYXQiOjE3MTQwMjY1OTMsImp0aSI6IjQ3YjkwMWY2ZjQ4YTQ5MzdiZTVkNGExZTczYjFkYmNlIiwidXNlcl9pZCI6NzIwfQ.F9SWY3hD-54B-3HWagw8TOL2DxQnKucEvdKZILCswP4'
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<StudentClassM> students = [];
      for (var item in jsonData['data']) {
        students.add(StudentClassM.fromJson(item));
      }
      return students;
    } else {
      throw Exception('Failed to load student data');
    }
  }
}
