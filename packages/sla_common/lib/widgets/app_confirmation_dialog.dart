import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConfirmationDialog extends StatelessWidget {
  const AppConfirmationDialog({
    Key? key,
    required this.message,
    required this.onConfirm,
    required this.onDisconfirm,
    this.confirmButtonText = "OK",
    this.disconfirmButtonText = "Cancel",
  }) : super(key: key);
  final String message;
  final Function onConfirm;
  final Function onDisconfirm;
  final String confirmButtonText;
  final String disconfirmButtonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Image(
                            image: AssetImage(
                              'assets/icons/app_icon.png',
                            ),
                            height: 45,
                            width: 45,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Text(
                          'Heat Pump',
                          style: GoogleFonts.nunito(
                            fontSize: 22,
                            color: AppColor.black08,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        message,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.black08,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildButton(
                          label: disconfirmButtonText,
                          onTap: () {
                            onDisconfirm.call(context);
                          },
                        ),
                        const SizedBox(width: 30),
                        _buildButton(
                          label: confirmButtonText,
                          onTap: () {
                            onConfirm.call(context);
                          },
                        ),
                      ],
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

  _buildButton({
    required String label,
    required Function onTap,
  }) {
    return Material(
      color: AppColor.primary01.withOpacity(0.5),
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () => onTap.call(),
        borderRadius: BorderRadius.circular(5),
        highlightColor: AppColor.primary04,
        splashColor: AppColor.primary04,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 9,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 17,
              color: AppColor.primary08,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
