import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({
    Key? key,
    this.title = "Default Title",
    this.onBackPress,
  }) : super(key: key);
  final String title;
  final Function? onBackPress;

  static const HEIGHT = kIsWeb ? 80 : 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              height: HEIGHT.w,
              width: context.width,
              color: Colors.transparent,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2.w),
                      bottomRight: Radius.circular(2.w),
                    ),
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => onBackPress?.call(),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.w),
                        bottomRight: Radius.circular(2.w),
                      ),
                      hoverColor: Colors.grey.shade100,
                      splashColor: Colors.grey.shade100,
                      highlightColor: Colors.grey.shade100,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 20.w),
                          child: SvgPicture.asset(
                            "assets/icons/arrow_left.svg",
                            package: slaCommon,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: HEIGHT.w,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    title.capitalizeAllWordsFirstLetter(),
                    style: GoogleFonts.roboto(
                      fontSize: 24.w,
                      color: AppColor.FF222222,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
