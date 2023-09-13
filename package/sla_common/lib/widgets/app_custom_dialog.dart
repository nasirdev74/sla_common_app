import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCustomDialog extends StatelessWidget {
  const AppCustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    this.onButtonClick,
    this.animationPath = "error.json",
  });

  final String title;
  final String subTitle;
  final String buttonText;
  final Function? onButtonClick;
  final String animationPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Center(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20.w,
                  left: 20.w,
                  right: 20.w,
                  bottom: 13.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 3.w),
                    Lottie.asset(
                      "assets/animations/$animationPath",
                      height: 145.w,
                    ),
                    SizedBox(height: 3.w),
                    Text(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        fontSize: 24.w,
                        color: AppColor.FF222222,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Text(
                      subTitle,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        height: 1.5,
                        fontSize: 16.w,
                        color: AppColor.FF3C3C41,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 12.w),
                    TextUnderlineButton(
                      label: buttonText,
                      onTap: () {
                        if (context.canPop()) context.pop();
                        onButtonClick?.call();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
