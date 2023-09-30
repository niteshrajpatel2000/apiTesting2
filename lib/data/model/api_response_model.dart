
import 'dart:convert';

AssignTaskResponseModel assignTaskResponseModelFromJson(String str) => AssignTaskResponseModel.fromJson(json.decode(str));

String assignTaskResponseModelToJson(AssignTaskResponseModel data) => json.encode(data.toJson());

class AssignTaskResponseModel {
  int? status;
  String? message;

  AssignTaskResponseModel({
     this.status,
     this.message,
  });

  factory AssignTaskResponseModel.fromJson(Map<String, dynamic> json) => AssignTaskResponseModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
