import 'dart:convert';
import 'package:edushalaacademy/utils/store_local_data.dart';
import 'package:get/get.dart';
import '../../models/vertual_details_models.dart';
import 'package:http/http.dart' as http;

class VirtualInterviewController extends GetxController {
  RxBool isSchedule = true.obs;
  Rx<InterviewResponse> interviewResponse = InterviewResponse(
    isError: true,
    message: "check in few days",
    msg: "PersonalInterview matching query does not exist.",
  ).obs;

  Future<void> fetchInterviewData() async {
    var headers = {'Authorization': 'Bearer ${SharedPref.accessToken}'};
    var url = Uri.parse('https://edushala.ablive.in/tutorapi/vinterview');

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        var responseModel = InterviewResponse.fromJson(data);
        interviewResponse.value = responseModel;

        if (!responseModel.isError) {
          isSchedule.value = false;
        }
      } else {
        throw Exception('Failed to fetch data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
