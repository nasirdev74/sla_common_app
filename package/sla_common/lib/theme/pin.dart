import 'app_colors.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sla_common/constants/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final defaultPinTheme = PinTheme(
  height: 44.w,
  width: 73.w,
  textStyle: GoogleFonts.roboto(
    fontSize: 14.w,
    color: AppColor.FF222222,
    fontWeight: FontWeight.w400,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
      color: AppColor.FFDFE1E4,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
  ),
  padding: EdgeInsets.zero,
  margin: EdgeInsets.zero,
);

final focusedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    border: Border.all(
      color: AppColor.FFF7691F,
      width: 1.2,
    ),
  ),
  textStyle: defaultPinTheme.textStyle?.copyWith(
    color: AppColor.FF222222,
  ),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    border: Border.all(
      color: AppColor.FFDFE1E4,
      width: 1.2,
    ),
  ),
  textStyle: defaultPinTheme.textStyle?.copyWith(
    color: AppColor.FF8E8E8E,
  ),
);

final errorPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    border: Border.all(
      color: AppColor.errorColor,
      width: 1.2,
    ),
  ),
  textStyle: defaultPinTheme.textStyle?.copyWith(
    color: AppColor.errorColor,
  ),
);
