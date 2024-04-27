import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/sub_catagory.dart';
import '../../models/teaching_pref_list.dart';
import '../../utils/store_local_data.dart';

class KycControllerOne extends GetxController {
  RxBool teachingPreferences = false.obs;
  RxBool educationalQualifications = false.obs;
  RxBool locationPreferences = false.obs;
  Future<void> fetchKycStatus() async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var request = http.Request(
        'GET', Uri.parse('https://edushala.ablive.in/tutorapi/kyc1status'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      // Parse the response body into a Map
      Map<String, dynamic> data =
          Map<String, dynamic>.from(json.decode(responseBody));
      print(data);
      // Update state variables with fetched data
      teachingPreferences.value = data['Teaching Preferences'] ?? false;
      educationalQualifications.value =
          data['Educational Qualifications'] ?? false;
      locationPreferences.value = data['Location Preferences'] ?? false;
    } else {
      print('Failed to fetch data: ${response.reasonPhrase}');
    }
  }
  RxList<TeachingPreference> teachingPreferencesList = <TeachingPreference>[].obs;

  Future<void> fetchTeachingPreferences() async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/teach_prefer/");

    try {
      var response = await http.get(url, headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'});
      var data = jsonDecode(response.body);
      print(data);

      if (response.statusCode == 200) {
        if (data['is_error'] == false) {
          List<TeachingPreference> teachingPreferences = (data['data'] as List)
              .map((item) => TeachingPreference.fromJson(item))
              .toList();
          teachingPreferencesList.assignAll(teachingPreferences);

          // Use the teachingPreferencesList as needed
          for (var preference in teachingPreferencesList) {
            print(preference);
          }
        } else {
          print('Error: ${data['message']}');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }



  List<SubCategory> selectedSubCategories = [];

  RxList<SubCategory> subCategories =
      <SubCategory>[].obs;
  var message = '';
  Future<void> fetchSubCategories(parentId) async {
    selectedSubCategories.clear();
    subCategories.value.clear(); // Clear the existing subCategories list
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/getadcategory/?parentid=$parentId");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['data'] != null) {
          List<SubCategory> preferences = [];
          for (var item in (data['data'] as List)) {
            var subCategory = SubCategory.fromJson(item);
            preferences.add(subCategory);
          }
          subCategories.value = (preferences);
          log("subCategories : ${subCategories.value.length} :: preferences : ${preferences.length} ");
          message = data["message"];
          print('Subcategories: $subCategories');
        } else {
          print('Data is null');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<dynamic> deleteCat({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/teach_prefer/?id=$id");

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


  Future<dynamic> submitKyc(id) async {
    var url = Uri.parse(
        "https://edushala.ablive.in/tutorapi/submitkyc?id=$id");

    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ${SharedPref.accessToken}'},
      );
      var data = jsonDecode(response.body);

      if (response.statusCode == 200){
        return data;
      } else {
        print('Error: ${response.statusCode}');
        return data;
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<dynamic> addTeachingPref(List<int> selectedSubCategoryIds) async {
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/teach_prefer/");

    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}',
      'Content-Type': 'application/json'
    };

    var body = json.encode({
      "id": selectedSubCategoryIds
    });

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print(body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        print(data);
        return data;
      } else {
        print('Failed to  Status Code: ${response.statusCode}');
        return data;
      }
    } catch (e) {
      print('An error occurred: $e');
      return {};
    }
  }

}
