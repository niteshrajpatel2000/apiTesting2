import 'package:apitest/data/model/api_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AssignTaskController extends GetxController {
  final _apiUrl = 'https://softwarewabi.com/rudra/backand/api/apicrm/auth-file/assign_task.php';
  Rx<AssignTaskResponseModel> assignTaskResponse = AssignTaskResponseModel().obs;
  Future<void> postAssignTaskDetails(String name, String phone, String title,String details, String deadline, String emp_id) async {
    final Map<String, dynamic> data = {
      "name" : name,
      "phone" : phone,
      "title" : title,
      "details" : details,
      "deadline" : deadline,
      "emp_id" : emp_id,
      "assign_to" : "6"
    };

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
        final responseData = jsonDecode(response.body);
        assignTaskResponse.value = AssignTaskResponseModel.fromJson(responseData);

    } catch (error) {
      assignTaskResponse.value = AssignTaskResponseModel(message: "Server encountered error", status: 500);
    }
  }
}
