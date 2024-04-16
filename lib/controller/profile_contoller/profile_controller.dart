import 'dart:convert';
import 'package:cordovatask/core/api_end_point/api_end_point.dart';
import 'package:cordovatask/model/user_model/user_model.dart';
import 'package:cordovatask/view/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  String userName = '';
  String userEmail = '';
  String userGender = '';
  String userStatus = '';
  bool isLoading = false;
  bool isError = false;

  getUserDetails(int id) async {
    isLoading = true;
    update();
    final response =
        await http.get(Uri.parse("${ApiEndPoint().baseUrl}/$id"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiEndPoint().token}'
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final singleUserdata = UserModel.fromJson(data);
      userName = singleUserdata.name!;
      userEmail = singleUserdata.email!;
      userGender = singleUserdata.gender!;
      userStatus = singleUserdata.status!;
      isLoading = false;
      update();
    } else if (response.statusCode == 404) {
      showToast(msg: 'The requested resource does not exist');
      isLoading = false;
      isError = true;
      update();
    }
  }

  updateUserDetail() {}
}
