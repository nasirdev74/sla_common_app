import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sla_common/sla_common.dart';

class NoInternetPresentation extends ConsumerWidget {
  const NoInternetPresentation({super.key});

  static const route = "/no_internet";

  @override
  Widget build(context, ref) {
    final logic = ref.read(noInternetProvider.notifier);
    return Scaffold(
      backgroundColor: AppColor.FFFFFF,
      resizeToAvoidBottomInset: false,
      body: WithBackgroundA(
        child: SafeArea(
          child: SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  "assets/animations/no_internet.json",
                  height: 350.w,
                ),
                Text(
                  "Oooops!",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: AppColor.FF222222,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 16.w),
                Text(
                  "No internet.\nPlease check your network connection",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    height: 1.5,
                    color: AppColor.FF3C3C41,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 18.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING.toDouble()),
                  child: TextUnderlineButton(
                    label: "Try Again",
                    onTap: () async => await logic.reCheck(),
                  ),
                ),
                SizedBox(height: 30.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
