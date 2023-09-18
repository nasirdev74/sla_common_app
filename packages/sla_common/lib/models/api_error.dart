import 'dart:convert';
import 'package:sla_logger/sla_logger.dart';

class ApiError {
  static final _log = AppLog(ApiError);

  var status = false;
  var code = 0;
  var message = 'No Message';

  ApiError({
    required this.status,
    required this.code,
    required this.message,
  });

  ApiError.empty();

  ApiError.fromJson(dynamic json) {
    const tag = "fromJson";
    try {
      status = json["status"] ?? status;
      code = json["code"] ?? code;
      message = json["message"] ?? message;
    } catch (e) {
      _log.e(tag, "json mapping failed", e);
    }
  }

  ApiError copyWith({
    bool? status,
    int? code,
    String? message,
  }) =>
      ApiError(
        status: status ?? this.status,
        code: code ?? this.code,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    const tag = "toJson";
    final json = <String, dynamic>{};
    try {
      json["status"] = status;
      json["code"] = code;
      json["message"] = message;
    } catch (e) {
      _log.e(tag, "convert to json failed", e);
    }
    return json;
  }

  @override
  String toString() => json.encode(this);
}
