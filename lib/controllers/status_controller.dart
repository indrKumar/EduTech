import 'dart:convert';
import 'package:edushalaacademy/View/main_actity.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/kyc_spep_one.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_4/qualified.dart';
import 'package:edushalaacademy/View/onBoarding/kyc_step_1/kyc_spep_one.dart';
import 'package:edushalaacademy/View/select_teacher_student.dart';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> navigateBasedOnStatus() async {
  var headers = {
    'Authorization': 'Bearer ${SharedPref.accessToken}'
  };
  var request = http.Request('GET', Uri.parse('https://edushala.ablive.in/tutorapi/status/'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var responseBody = await response.stream.bytesToString();
    var data = json.decode(responseBody);
    var status = data['status'];
    if (data != null && data['is_error'] == false) {
      if(status == 1){
      Get.offAll(()=>const Kyc_Step_One_Screen());
      }else if(status == 2){
        Get.offAll(()=>const Kyc_Step_Four_Vidio());
      }else if(status == 3){
        Get.offAll(()=>const QualifiedScreen());
      }else if(status == 0){
        SharedPref.setBoolSp(SharedPref.SP_KEY_IS_COMPLETE_IN, true);
        Get.offAll(()=>const MainActivity());
      }
    } else {
      Get.to(()=>const SelectTeacherOrParent());
    }
  } else {
    print('Failed to fetch status: ${response.reasonPhrase}');
  }
}
