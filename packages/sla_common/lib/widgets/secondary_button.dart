import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.label,
    this.onTap,
    this.enabled = true,
    this.height = 44,
    this.width = 343,
    this.loading = false,
  }) : super(key: key);
  final String label;
  final Function? onTap;
  final bool enabled;
  final double height;
  final double width;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.FFFFFF,
      borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
      child: InkWell(
        splashColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade200,
        hoverColor: Colors.grey.shade200.withOpacity(0.5),
        borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
        onTap: enabled ? () async => onTap?.call() : null,
        child: Container(
          width: width.w,
          height: height.w,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColor.FFDFE1E4,
            ),
            borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
          ),
          child: Center(
            child: loading
                ? SizedBox(
                    height: height / 2,
                    width: height / 2,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    label,
                    style: GoogleFonts.roboto(
                      fontSize: 16.w,
                      color: AppColor.FF222222,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
