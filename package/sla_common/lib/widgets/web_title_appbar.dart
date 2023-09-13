import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebTitleAppBar extends StatelessWidget {
  const WebTitleAppBar({
    super.key,
    this.title = "Title",
    this.titleFontSize = 34,
  });

  final String title;
  final double titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: kIsWeb,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.w),
          Text(
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            title.capitalizeAllWordsFirstLetter(),
            style: GoogleFonts.roboto(
              color: AppColor.FF222222,
              fontSize: titleFontSize.w,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.w),
        ],
      ),
    );
  }
}
