import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sla_common/sla_common.dart';

class AppBackgroundA extends StatelessWidget {
  const AppBackgroundA({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Container(
            width: context.width,
            height: context.height,
            color: const Color(0xFFF7F7F7),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildColoredCircle(
                    color: const Color(0xFFF8D8C7),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildColoredCircle(
                    color: const Color(0xFFE7D7B4),
                  ),
                ],
              ),
            ],
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 90,
              sigmaY: 90,
            ),
            child: SizedBox(
              width: context.width,
              height: context.height,
            ),
          ),
        ],
      ),
    );
  }

  _buildColoredCircle({required Color color}) {
    return Container(
      width: 214.w,
      height: 214.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class WithBackgroundA extends StatelessWidget {
  const WithBackgroundA({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            kIsWeb ? const SizedBox.shrink() : const AppBackgroundA(),
            child,
          ],
        ),
      ),
    );
  }
}
