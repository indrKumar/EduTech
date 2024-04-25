
import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:edushalaacademy/models/interview_status_model.dart';

import '../../utils/store_local_data.dart';

class VirtualInterviewStatusController extends GetxController {
  // RxBool isSchedule = true.obs;
  Rx<InterviewStatus> interviewResponse = InterviewStatus(
    isError: true,
    message: "check in few days",
    msg: "PersonalInterview matching query does not exist.",
  ).obs;

  Future<void> fetchInterviewStatusData() async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var url = Uri.parse('https://edushala.ablive.in/tutorapi/vintv_status/');

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        print(data);
        var responseModel = InterviewStatus.fromJson(data);
        interviewResponse.value = responseModel;


        if (!responseModel.isError! && responseModel.status != null) {
          // isSchedule.value = !responseModel.status!;
        }
      } else {
        throw Exception('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}