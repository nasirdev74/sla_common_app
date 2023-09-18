import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NetworkSensitivity(child: SLACommonApp()));
}

class SLACommonApp extends StatelessWidget {
  const SLACommonApp({super.key});

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
            backgroundColor: AppColor.primary,
            body: Center(
              child: Text(
                "SLA Common",
                style: GoogleFonts.roboto(
                  fontSize: 30.w,
                  color: AppColor.FFFFFF,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
