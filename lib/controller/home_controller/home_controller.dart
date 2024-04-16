import 'dart:convert';
import 'package:cordovatask/core/api_end_point/api_end_point.dart';
import 'package:cordovatask/model/user_model/user_model.dart';
import 'package:cordovatask/view/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = RxList([]);
  int pageCount = 2;

  void getUserDataList() async {
    isLoading.value = true;
    final response = await http
        .get(Uri.parse("${ApiEndPoint().baseUrl}?page=1&per_page=5"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiEndPoint().token}'
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      userList.value = data.map((e) => UserModel.fromJson(e)).toList();
    }

    isLoading.value = false;
  }

  void fetchMoreDataList() async {
    final response = await http
        .get(Uri.parse("${ApiEndPoint().baseUrl}?page=$pageCount&per_page=5"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      userList.addAll(data.map((e) => UserModel.fromJson(e)).toList());
      pageCount++;
    }
  }

  void delete(userId) async {
    final response = await http
        .delete(Uri.parse("${ApiEndPoint().baseUrl}/$userId"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${ApiEndPoint().token}'
    });
    if (response.statusCode == 204) {
      getUserDataList();
      showToast(msg: "Deleted successfully");
    }
  }
}
