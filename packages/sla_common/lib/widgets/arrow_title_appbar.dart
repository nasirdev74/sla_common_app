import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArrowTitleAppBar extends StatelessWidget {
  const ArrowTitleAppBar({
    super.key,
    required this.title,
    this.titleFontSize = 24,
    this.arrowTitleDistance = 1.5,
    this.onPop,
    this.maxLines = 1,
    this.height = HEIGHT,
  });

  final double height;

  static const HEIGHT = 84.5;
  static const MIN_HEIGHT = 83.0;

  final String title;
  final double titleFontSize;
  final double arrowTitleDistance;
  final Function? onPop;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !kIsWeb,
      child: Positioned(
        top: 0,
        left: 0,
        child: SizedBox(
          height: height.w,
          width: context.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4.w),
                  bottomRight: Radius.circular(4.w),
                ),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (context.canPop()) context.pop();
                    onPop?.call();
                  },
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.w),
                    bottomRight: Radius.circular(4.w),
                  ),
                  highlightColor: Colors.grey.shade100,
                  splashColor: Colors.grey.shade100,
                  hoverColor: Colors.grey.shade100,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 20.w,
                      top: 10.w,
                      bottom: 10.w,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/arrow_left.svg",
                      fit: BoxFit.fitWidth,
                      width: 30.w,
                      package: slaCommon,
                    ),
                  ),
                ),
              ),
              SizedBox(height: arrowTitleDistance.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  maxLines: maxLines,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  title.isNotEmpty ? title.capitalizeAllWordsFirstLetter() : title,
                  style: GoogleFonts.roboto(
                    fontSize: titleFontSize.w,
                    color: AppColor.FF222222,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 2.w),
            ],
          ),
        ),
      ),
    );
  }
}
