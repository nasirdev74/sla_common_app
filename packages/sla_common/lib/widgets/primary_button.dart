import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.highlightColor = AppColor.FFAE3C00,
    this.textColor = AppColor.FFFFFF,
    this.height = 44,
    this.width = 343,
    this.loading = false,
    this.activeColor = AppColor.FFF7691F,
    this.inactiveColor,
    this.enabled,
  }) : super(key: key);
  final String label;
  final Function? onTap;
  final Color highlightColor;
  final Color textColor;
  final double height;
  final double width;
  final bool loading;
  final Color activeColor;
  final Color? inactiveColor;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.w,
      child: Material(
        color: (loading || !(enabled ?? true))
            ? inactiveColor ?? activeColor.withOpacity(0.7)
            : activeColor,
        borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
        child: InkWell(
          onTap: loading
              ? null
              : enabled ?? true
                  ? () => onTap?.call()
                  : null,
          highlightColor: highlightColor,
          splashColor: highlightColor,
          hoverColor: highlightColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontSize: 16.w,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Visibility(
                  visible: loading,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20.w),
                      SizedBox(
                        width: (height / 3).w,
                        height: (height / 3).w,
                        child: const CircularProgressIndicator(
                          color: AppColor.FFFFFF,
                          strokeWidth: 2,
                        ),
                      ),
                    ],
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
