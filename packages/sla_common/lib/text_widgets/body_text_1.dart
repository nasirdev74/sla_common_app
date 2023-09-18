import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyText1 extends StatelessWidget {
  const BodyText1(this.bodyText1, {super.key});

  final String bodyText1;

  @override
  Widget build(context) {
    return Text(
      bodyText1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        fontSize: 20.w,
        color: AppColor.FF222222,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
