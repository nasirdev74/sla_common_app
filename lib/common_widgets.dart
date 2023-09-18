import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class CommonWidgetsView extends StatelessWidget {
  const CommonWidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                AppInput(
                  isPassword: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
