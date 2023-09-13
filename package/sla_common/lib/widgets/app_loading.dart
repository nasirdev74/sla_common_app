import 'dart:ui';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key, this.inProgress = false}) : super(key: key);
  final bool inProgress;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: inProgress,
      child: Container(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Center(
            child: Container(
              width: 140.w,
              height: 140.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Lottie.asset(
                  "assets/animations/loading.json",
                  height: 140.w,
                  width: 140.w,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
