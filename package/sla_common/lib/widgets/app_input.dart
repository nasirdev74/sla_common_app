import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    Key? key,
    this.label = "Label",
    this.controller,
    this.focusNode,
    this.hintText,
    this.prefixIconPath,
    this.prefixIconWidth = 25,
    this.suffixIconPath,
    this.suffixIconWidth = 25,
    this.maxLines = 1,
    this.onSubmitted,
    this.enabled = true,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.isPassword = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.next,
    this.textAlignVertical = TextAlignVertical.center,
    this.height = 45,
    this.width,
    this.labelInputSeparatorHeight = 4,
    this.showLabel = true,
    this.validator,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final String? prefixIconPath;
  final double prefixIconWidth;
  final String? suffixIconPath;
  final double suffixIconWidth;
  final int maxLines;
  final Function? onSubmitted;
  final bool enabled;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool isPassword;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextAlignVertical textAlignVertical;
  final double height;
  final double? width;
  final double labelInputSeparatorHeight;
  final bool showLabel;
  final String? Function(String?)? validator;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> with TickerProviderStateMixin {
  bool hasError = false;
  bool obscureText = true;

  validate(String? value) => setState(() => hasError = value == null || value.isEmpty);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.showLabel,
            child: Text(
              widget.label,
              style: GoogleFonts.roboto(
                fontSize: 16.w,
                color: AppColor.FF222222,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Visibility(
            visible: widget.showLabel,
            child: SizedBox(
              height: widget.labelInputSeparatorHeight.w,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DEFAULT_BORDER_RADIUS),
              border: Border.all(
                width: 1.w,
                color: const Color(0xFFCED2DA),
              ),
            ),
            width: widget.width ?? context.width,
            height: widget.height.w,
            child: Center(
              child: TextFormField(
                autofocus: false,
                enabled: widget.enabled,
                maxLines: widget.maxLines,
                focusNode: widget.focusNode,
                controller: widget.controller,
                cursorColor: AppColor.FF222222,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                obscureText: widget.isPassword ? obscureText : widget.obscureText,
                obscuringCharacter: '*',
                textCapitalization: widget.textCapitalization,
                textAlignVertical: widget.textAlignVertical,
                textAlign: TextAlign.start,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  border: inputBorder,
                  enabledBorder: inputBorder,
                  focusedBorder: inputBorder,
                  disabledBorder: inputBorder,
                  focusedErrorBorder: inputBorder,
                  errorBorder: inputBorder,
                  hoverColor: Colors.transparent,
                  suffixIcon: widget.isPassword || widget.suffixIconPath != null
                      ? Material(
                          color: AppColor.inputBackground,
                          type: MaterialType.transparency,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(DEFAULT_BORDER_RADIUS),
                            bottomRight: Radius.circular(DEFAULT_BORDER_RADIUS),
                          ),
                          child: InkWell(
                            onTap: () => setState(() => obscureText = !obscureText),
                            highlightColor: Colors.grey.shade200,
                            splashColor: Colors.grey.shade200,
                            focusColor: Colors.grey.shade200,
                            canRequestFocus: false,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(DEFAULT_BORDER_RADIUS),
                              bottomRight: Radius.circular(DEFAULT_BORDER_RADIUS),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: widget.isPassword
                                  ? obscureText
                                      ? [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 5.w,
                                              right: 10.w,
                                            ),
                                            child: SvgPicture.asset(
                                              kIcons.eyeClosed,
                                              fit: BoxFit.fitWidth,
                                              width: widget.suffixIconWidth.w,
                                            ),
                                          )
                                        ]
                                      : [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 5.w,
                                              right: 10.w,
                                            ),
                                            child: SvgPicture.asset(
                                              kIcons.eyeOpen,
                                              fit: BoxFit.fitWidth,
                                              width: widget.suffixIconWidth.w,
                                            ),
                                          )
                                        ]
                                  : widget.suffixIconPath == null
                                      ? []
                                      : widget.suffixIconPath?.endsWith('.svg') ?? false
                                          ? [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 5.w,
                                                  right: 10.w,
                                                ),
                                                child: SvgPicture.asset(
                                                  widget.suffixIconPath!,
                                                  fit: BoxFit.fitWidth,
                                                  width: widget.suffixIconWidth.w,
                                                ),
                                              )
                                            ]
                                          : [],
                            ),
                          ),
                        )
                      : null,
                  suffixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  prefixIcon: widget.prefixIconPath == null
                      ? null
                      : widget.prefixIconPath?.endsWith('.svg') ?? false
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 22.35.w),
                                SvgPicture.asset(
                                  widget.prefixIconPath!,
                                  fit: BoxFit.fitWidth,
                                  width: widget.prefixIconWidth.w,
                                ),
                                SizedBox(width: 12.31.w),
                              ],
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 22.35.w),
                                Image.asset(
                                  widget.prefixIconPath!,
                                  fit: BoxFit.fitWidth,
                                  width: widget.prefixIconWidth.w,
                                ),
                                SizedBox(width: 12.31.w),
                              ],
                            ),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                  filled: true,
                  hintText: widget.hintText,
                  fillColor: AppColor.FFFFFF,
                  isCollapsed: true,

                  /// use less vertical space
                  isDense: false,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.prefixIconPath == null ? 12.w : 12.w,
                    vertical: widget.maxLines > 1 ? 5.w : 0,
                  ),
                  hintMaxLines: widget.maxLines,
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 14.w,
                    color: AppColor.FF8E8E8E,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                style: GoogleFonts.roboto(
                  fontSize: 14.w,
                  color: AppColor.FF222222,
                  fontWeight: FontWeight.w400,
                ),
                strutStyle: StrutStyle(
                  fontSize: 14.w,
                  height: 1.5,
                ),
                onFieldSubmitted: (_) => widget.onSubmitted?.call(_),
                onChanged: (String value) {
                  if (hasError) validate(value);
                },
                validator: (String? value) {
                  if (widget.validator == null) {
                    if ((value?.removeAllWhitespace.isEmpty ?? true) && widget.errorText != null) {
                      setState(() => hasError = true);
                    }
                  } else {
                    if (widget.validator?.call(value) != null) {
                      setState(() => hasError = true);
                    } else {
                      setState(() => hasError = false);
                    }
                  }
                  return null;
                },
              ),
            ),
          ),
          hasError
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.w),
                    Text(
                      widget.errorText ?? "Enter your value",
                      style: errorTextStyle,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
