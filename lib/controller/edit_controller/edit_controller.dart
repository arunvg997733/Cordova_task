import 'package:cordovatask/controller/home_controller/home_controller.dart';
import 'package:cordovatask/core/api_end_point/api_end_point.dart';
import 'package:cordovatask/view/widget/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EditController extends GetxController {
  GlobalKey<FormState> fkey = GlobalKey<FormState>();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController genderCtr = TextEditingController();
  TextEditingController statusCtr = TextEditingController();

  updateUserData(int userId) async {
    final body = {
      "name": nameCtr.text,
      "email": emailCtr.text,
      "gender": genderCtr.text,
      "status": statusCtr.text
    };
    final response =
        await http.put(Uri.parse("${ApiEndPoint().baseUrl}/$userId"),
            headers: {
              'Accept': 'application/json',
              // 'Content-Type': 'application/json',
              'Authorization': 'Bearer ${ApiEndPoint().token}'
            },
            body: body);
    if (response.statusCode == 200) {
      showToast(msg: 'Updated successfully');
      Get.back();
      Get.find<HomeController>().getUserDataList();
    }
  }
}
