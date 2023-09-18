import 'dart:convert';
import 'package:sla_logger/sla_logger.dart';

/// used to throw custom exception
class AppException implements Exception {
  static final logger = AppLog(AppException);

  AppException(this.message);

  final dynamic message;

  Map<String, dynamic> toJson() {
    const tag = "toJson";
    var json = <String, dynamic>{};
    try {
      json["message"] = message.toString();
    } catch (e) {
      logger.e(tag, "convert to json failed", e);
    }
    return json;
  }

  @override
  String toString() => json.encode(this);
}
