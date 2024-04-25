import 'dart:convert';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:http/http.dart' as http;

import '../models/tutor_class_model.dart';

class TutorController {
  Future<List<TutorClass>> fetchTutorClasses({String? type}) async {
    const String apiUrl = 'https://edushala.ablive.in/tutorapi/tutorclass/';
     String authToken = 'Bearer ${SharedPref.accessToken}';
    final Map<String, String> queryParams = {'type': type ?? 'Demo'};
    final Uri uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
    print(uri);
    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        print("DTA:$data");
        print(json.decode(response.body));
        return data.map((json) => TutorClass.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tutor classes: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to load tutor classes: $e');
    }
  }
}