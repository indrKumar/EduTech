import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/parencategory_model.dart';
import '../../models/sub_catagory.dart';

class StepController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }
  RxList<SubCategory> subCategories = <SubCategory>[].obs;
  var message = '';

  Future<void> fetchCategoriesParent() async {
    subCategories.value.clear();
    var url = Uri.parse("https://edushala.ablive.in/tutorapi/getadcategory/");

    try {
      var response = await http.get(url);


      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        CategoryResponse categoryResponse = CategoryResponse.fromJson(data);
        message = categoryResponse.message;
        print(categoryResponse.data);
        subCategories.value = (categoryResponse.data);
        log(categoryResponse.data.length.toString());
        log("subCategories : ${subCategories.value.length} :: categoryResponse : ${categoryResponse.data.length} ");
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
