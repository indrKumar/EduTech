import 'dart:convert';

import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:http/http.dart' as http;

import '../models/tutor_class_model.dart';

class TutorController {
  Future<List<TutorClass>> fetchTutorClasses(
      {String? type, int pageNumber = 1}) async {
    const String apiUrl = 'https://edushala.ablive.in/tutorapi/tutorclass/';
    String authToken = 'Bearer ${SharedPref.accessToken}';
    final Map<String, String> queryParams = {
      'type': type ?? 'Demo',
      'page': pageNumber.toString(),
    };
    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];
        print(response.body);
        return data.map((json) => TutorClass.fromJson(json)).toList();
      } else {
        throw Exception(
            'Failed to load tutor classes: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load tutor classes: $e');
    }
  }

  Future<StartDuModel?> fetchDataDur(
      {id, String? recovery, String? teacher}) async {
    print("${recovery} $id,  $teacher");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url = Uri.parse(
          'https://edushala.ablive.in/tutorapi/tutorclass/?recovery=${recovery ?? ''}&teacher=${teacher ?? ''}&id=$id');
      var response = await http.get(url, headers: headers);

      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return StartDuModel.fromJson(jsonDecode(response.body));
        } else {
          // Handle the case where the response data is null
          return null;
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Map<String, dynamic>?> markAttendance({
    required String classId,
    String? cycleId,
    String? type,
  }) async {
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url = Uri.parse('https://edushala-express-api.onrender.com/attendance/start');
      var response = await http.post(
        url,
        headers: headers,
        body: {
          "class_id": classId,
          "classcycle_id": cycleId ?? "1", // Default to "1" if cycleId is null
          "class_type": type,
        },
      );

      print("RESPONSE: ${response.body}");

      if (response.statusCode == 201) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle empty response
          return null;
        }
      } else {
        // Log and throw exception for non-200 status codes
        print("Error response: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception('Failed to mark attendance: ${response.reasonPhrase}');
      }
    } catch (e) {
      print("Exception details: $e"); // Print detailed exception
      throw Exception('Failed to fetch data: $e');
    }
  }
  Future<dynamic> getCycle({String? id, String? status}) async {
    print("BODY INPUT:::${id}, ${status}");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url = Uri.parse('https://edushala-express-api.onrender.com/attendance/getAllCycle/$id?status=$status');
      var response = await http.get(
        url,
        headers: headers,
      );

      print("RESPONSsssE: ${response.body}");

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle empty response
          return null;
        }
      } else {
        // Log and throw exception for non-200 status codes
        print("Error response: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception('Failed to mark attendance: ${response.reasonPhrase}');
      }
    } catch (e) {
      print("Exception details: $e"); // Print detailed exception
      throw Exception('Failed to fetch data: $e');
    }
  }


  Future<dynamic> getAttendance({String? id, String? status}) async {
    print("BODY INPUT:::${id}, ${status}");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url = Uri.parse('https://edushala-express-api.onrender.com/attendance/$id?status=$status');
      var response = await http.get(
        url,
        headers: headers,
      );

      print("RESPONSsssE: ${response.body}");

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle empty response
          return null;
        }
      } else {
        // Log and throw exception for non-200 status codes
        print("Error response: ${response.statusCode} - ${response.reasonPhrase}");
        throw Exception('Failed to mark attendance: ${response.reasonPhrase}');
      }
    } catch (e) {
      print("Exception details: $e"); // Print detailed exception
      throw Exception('Failed to fetch data: $e');
    }
  }
  Future<Map<String, dynamic>?> classEnd({classId, String? cycleId}) async {
    // print("${recovery} $id,  $teacher");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url =
          Uri.parse('https://edushala-express-api.onrender.com/attendance/end');
      var response = await http.post(url, headers: headers, body: {
        "class_id": classId,
        "classcycle_id": cycleId,
      });

      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle the case where the response data is null
          return null;
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
  Future<Map<String, dynamic>?> extendClass(
      {classId, String? cycleId, extendType, extendTime, recoveryFor}) async {
    // print("${recovery} $id,  $teacher");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      print("class_i $classId"
          "classcycle_id $cycleId"
          "extendType $extendType" //extra,recovery
          "extendTime $extendTime"
    "recoveryFor $recoveryFor");
      var url =
          Uri.parse('https://edushala-express-api.onrender.com/attendance/extend');
      var response = await http.post(url, headers: headers, body: {
        "class_id": classId,
        "classcycle_id": cycleId,
        "extendType": extendType, //extra,recovery
        "extendTime": extendTime.toString(),
        "recoveryFor": recoveryFor //only whern extendtype=='recovery' parent,tutor
      });

      print("RESPONSE: ${response.body}");

      if (response.statusCode == 201) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle the case where the response data is null
          return null;
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Map<String, dynamic>?> markLeave(
      {classId, String? cycleId, leaveBy, leaveDays}) async {
    // print("${recovery} $id,  $teacher");
    try {
      var headers = {
        'Authorization': 'Bearer ${SharedPref.accessToken}',
      };

      var url =
          Uri.parse('https://edushala-express-api.onrender.com/attendance/extend');
      var response = await http.post(url, headers: headers, body: {
        "class_id": classId,
        "classcycle_id": cycleId,
        "leaveBy": leaveBy, //extra,recovery
        "leaveDays": leaveDays,
      });

      print("RESPONSE: ${response.body}");

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          // Handle the case where the response data is null
          return null;
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}

class StartDuModel {
  bool isError;
  String message;
  int duration;

  StartDuModel({
    required this.isError,
    required this.message,
    required this.duration,
  });

  factory StartDuModel.fromJson(Map<String, dynamic> json) {
    return StartDuModel(
      isError: json['is_error'] ?? '',
      message: json['message'] ?? '',
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'is_error': isError,
      'message': message,
      'duration': duration,
    };
  }
}
