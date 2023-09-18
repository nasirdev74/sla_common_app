import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 200,
              sigmaY: 200,
            ),
            child: Container(
              width: context.width,
              height: context.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF4F4F4),
                    Color(0xFFF9F9F9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          /// top circle
          Positioned(
            top: 38.w,
            left: -16.w,
            child: Container(
              width: 247.w,
              height: 247.w,
              decoration: const BoxDecoration(
                color: Color(0xFFF7691F),
                shape: BoxShape.circle,
              ),
            ),
          ),

          /// bottom circle
          Positioned(
            bottom: -66,
            right: -68,
            child: Container(
              width: 247.w,
              height: 247.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFCA302).withOpacity(0.6),
              ),
            ),
          ),

          SizedBox(
            width: context.width,
            height: context.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 200,
                sigmaY: 200,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
