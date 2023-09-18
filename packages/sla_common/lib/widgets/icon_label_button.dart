import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconLabelButton extends StatelessWidget {
  const IconLabelButton({
    super.key,
    required this.iconPath,
    this.label = "Tap Here",
    this.iconSize = 16,
  });

  final String iconPath;
  final String label;
  final int iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Material(
        color: AppColor.FFFFFF,
        borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
        child: InkWell(
          onTap: () => {},
          splashColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade300,
          hoverColor: Colors.grey.shade300.withOpacity(0.5),
          borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
          child: Container(
            height: 44.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
              border: Border.all(
                width: 1.w,
                color: const Color(0xFFCED2DA),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: iconSize.w,
                  child: SvgPicture.asset(
                    iconPath,
                    fit: BoxFit.fitWidth,
                    width: iconSize.w,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontSize: 16.w,
                    color: AppColor.FF222222,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
