import 'dart:convert';
import 'package:sla_logger/sla_logger.dart';
import 'package:sla_common/models/models.dart';

class ApiData {
  static final logger = AppLog(ApiData);

  var success = false;
  dynamic data;
  var message = 'No Message';
  var error = ApiError.empty();

  ApiData({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  ApiData.empty();

  ApiData.fromJson(dynamic json) {
    const tag = "fromJson";
    try {
      success = json["success"] ?? success;
      data = json["data"];
      message = json["message"] ?? message;
      error = ApiError.fromJson(json["error"] ?? {});
    } catch (e) {
      logger.e(tag, "json mapping failed", e);
    }
  }

  ApiData copyWith({
    bool? success,
    dynamic data,
    String? message,
    ApiError? error,
  }) =>
      ApiData(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        error: error ?? this.error,
      );

  Map<String, dynamic> toJson() {
    const tag = "toJson";
    final json = <String, dynamic>{};
    try {
      json["success"] = success;
      json["data"] = data;
      json["message"] = message;
      json["error"] = error.toJson();
    } catch (e) {
      logger.e(tag, "convert to json failed", e);
    }
    return json;
  }

  @override
  String toString() => json.encode(this);
}
