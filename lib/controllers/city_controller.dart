import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/dropdown_popup.dart';

class CityController extends GetxController {
  var stateList = <SelectionPopupModel>[].obs;
  var cityList = <SelectionPopupModel>[].obs;
  RxBool isTrue = false.obs;
  @override
  void onInit() {
    super.onInit();
    getStateDetails();
  }


  Future<void> getCityDetails({id}) async {
    var url = Uri.parse("https://edushala.ablive.in/studentapi/city/?state=$id");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['is_error'] != null && !data['is_error']) {
          List<SelectionPopupModel> cities = (data['data'] as List).map((e) => SelectionPopupModel(
            id: e['id'],
            title: e['name'],
            value: e,
            isSelected: false,
          )).toList();
          cityList.assignAll(cities);
        } else {
          print('Error message: ${data['message']}');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }


  Future<void> getStateDetails() async {
    cityList.value.clear();
    var url = Uri.parse("https://edushala.ablive.in/studentapi/state/");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['is_error'] != null && !data['is_error']) {
          List<SelectionPopupModel> states = (data['data'] as List).map((e) => SelectionPopupModel(
            id: e['id'],
            title: e['name'],
            value: e,
            isSelected: false,
          )).toList();
          stateList.assignAll(states);
        } else {
          print('Error message: ${data['message']}');
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
