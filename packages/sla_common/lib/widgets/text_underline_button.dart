import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextUnderlineButton extends StatelessWidget {
  const TextUnderlineButton({
    super.key,
    this.label = "Tap Here",
    this.underline = true,
    this.onTap,
  });

  final String label;
  final Function? onTap;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
      child: InkWell(
        onTap: () => onTap?.call(),
        borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
        hoverColor: AppColor.FFF7691F.withOpacity(0.1),
        splashColor: AppColor.FFF7691F.withOpacity(0.2),
        highlightColor: AppColor.FFF7691F.withOpacity(0.2),
        child: SizedBox(
          height: 40.w,
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.roboto(
                fontSize: 14.w,
                color: AppColor.FFF7691F,
                fontWeight: FontWeight.w400,
                decoration: underline ? TextDecoration.underline : TextDecoration.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
