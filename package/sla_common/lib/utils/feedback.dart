import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sla_common/models/models.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class AppFeedback {
  static showBottomSnackFeedback({
    Color color = Colors.grey,
    required String message,
  }) {}

  static showTopSnackError({
    String message = 'Error Occurred',
  }) {}

  static showShortError(String? error, {String? or}) {
    if (error == null && or == null) return;
    Vibrate.feedback(FeedbackType.success);
    // snackBarKey.currentState?.showSnackBar(
    //   SnackBar(
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //     duration: const Duration(seconds: 2),
    //     content: AppShortFeedback(message: error ?? '', isError: true),
    //   ),
    // );
  }

  static FutureOr<Null> onAPIError(Object error, StackTrace stackTrace) async {
    if (error is AppException) {
      showShortError(error.message ?? 'Exception Occurred');
    } else {
      showShortError('Exception Occurred');
    }
  }

  static showShortSucceed(String? message) {
    if (message == null) return;
    // snackBarKey.currentState?.showSnackBar(
    //   SnackBar(
    //     elevation: 0,
    //     backgroundColor: Colors.transparent,
    //     duration: const Duration(seconds: 2),
    //     content: AppShortFeedback(message: message, isError: false),
    //   ),
    // );
  }
}
