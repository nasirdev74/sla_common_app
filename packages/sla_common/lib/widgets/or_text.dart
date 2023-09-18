import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrText extends StatelessWidget {
  const OrText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1.sp,
            color: AppColor.FFDFE1E4,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 11.w,
          ),
          child: Text(
            "or",
            style: GoogleFonts.roboto(
              fontSize: 14.w,
              color: AppColor.FF8E8E8E,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1.sp,
            color: AppColor.FFDFE1E4,
          ),
        ),
      ],
    );
  }
}
