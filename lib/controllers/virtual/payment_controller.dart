import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../utils/store_local_data.dart';

class PayController extends GetxController {

  RxBool isLoading = false.obs;

  Future<Map<String, dynamic>> fetchPaymentData() async {
    isLoading.value = true;

    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}',
    };

    var url = Uri.parse('https://edushala.ablive.in/tutorapi/pay/');

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        isLoading.value = false;
        return json.decode(response.body);
      } else {
        isLoading.value = false;
        throw Exception('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      isLoading.value = false;
      throw Exception('Failed to fetch data: $e');
    }
  }
   Future<dynamic> payPayment() async {
    var headers = {
      'Authorization': 'Bearer ${SharedPref.accessToken}'
    };

    var url = Uri.parse('https://edushala.ablive.in/tutorapi/pay/');

    try {
      var response = await http.post(url, headers: headers);
var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(data);
        return data;
      } else {
        print(data);
        throw Exception('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

}
