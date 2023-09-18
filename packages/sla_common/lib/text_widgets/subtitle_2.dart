import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubTitle2 extends StatelessWidget {
  const SubTitle2({
    super.key,
    this.subtitle2 = "Subtitle2",
    this.height = 1,
  });

  final String subtitle2;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle2,
      textAlign: TextAlign.start,
      style: GoogleFonts.roboto(
        fontSize: 16.w,
        color: AppColor.FF545454,
        fontWeight: FontWeight.w400,
        height: height,
      ),
    );
  }
}
