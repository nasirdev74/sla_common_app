import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonTypeA extends StatelessWidget {
  const ButtonTypeA({
    super.key,
    this.onTap,
    this.label = "",
  });

  final Function? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        height: 44.w,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFFF7691F),
              Color(0xFFFFA400),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(6.w),
          child: InkWell(
            onTap: () {},
            hoverColor: context.hoverColor,
            highlightColor: context.highlightColor,
            splashColor: context.splashColor,
            borderRadius: BorderRadius.circular(6.w),
            child: Center(
              child: Text(
                label,
                style: w500_16_FFFFFF,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
