import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../utils/store_local_data.dart';
class TeachingController extends GetxController{
  Future<dynamic> addTeachingLocation(
      {addressL1,
        addressL2,
        landmark,
        pincode,
        state,
        lat,
        city,
        long}) async {
    // if (name.toString().isEmpty || email.toString().isEmpty) {
    // Return an empty map if the contact number is invalid
    // return {};
    // }
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/teachloc/");

    var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${SharedPref.accessToken}',
      };
    var body = json.encode({
      "addressL1": addressL1,
      "addressL2": addressL2,
      "landmark": landmark,
      "pincode": pincode,
      "state": state,
      "city": city,
      "lat": lat,
      "long": long
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
        print(data); // Print response data if needed
        return data; // Return the response data if the request is successful
      } else {
        print('Failed to  Status Code: ${response.statusCode}');
        // Return an empty map if the request fails
        return data;
      }
    } catch (e) {
      print('An error occurred: $e');
      // Return an empty map if an error occurs
      return {};
    }
  }

}
