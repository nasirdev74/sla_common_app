import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DegreeIcon extends StatelessWidget {
  const DegreeIcon({
    super.key,
    this.size = 6,
    this.color = AppColor.FFFFFF,
    this.strokeWidth = 1.2,
  });

  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: strokeWidth.w,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
