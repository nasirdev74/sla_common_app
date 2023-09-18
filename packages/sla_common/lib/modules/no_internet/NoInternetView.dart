import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  static const route = "/no_internet";

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: AppSettings.designSize,
      builder: (_, __) {
        return MaterialApp(
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: AppColor.FFFFFF,
            resizeToAvoidBottomInset: false,
            body: WithBackgroundA(
              child: SafeArea(
                child: SizedBox(
                  width: context.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/animations/no_internet.json",
                        package: slaCommon,
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
                      SizedBox(height: 16),
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
                      SizedBox(height: 18),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: DEFAULT_PADDING.toDouble()),
                        child: TextUnderlineButton(
                          label: "Try Again",
                          onTap: () async => await NetworkUtils().checkInternet(),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
