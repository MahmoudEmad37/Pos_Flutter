class ResponseModel {
  dynamic success;
  dynamic message;
  dynamic data = {};

  ResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json;
  }
}

