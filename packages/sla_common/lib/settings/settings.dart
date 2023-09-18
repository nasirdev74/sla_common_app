import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sla_logger/sla_logger.dart';

class AppSettings {
  static final _log = AppLog(AppSettings);

  /// app ui and overlays settings

  /// allow portrait up only
  static const _orientations = [DeviceOrientation.portraitUp];

  /// ui mode manual
  static const _uiMode = SystemUiMode.manual;

  /// preferred overlays
  static const _overlays = [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ];

  /// preferred overlay style
  static const _overlayStyle = SystemUiOverlayStyle(
    /// for transparent status bar
    statusBarColor: Colors.transparent,

    /// for dark status bar icons
    statusBarBrightness: Brightness.light,

    /// black bottom navigation bar
    systemNavigationBarColor: Colors.black,
    systemStatusBarContrastEnforced: false,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarDividerColor: Colors.black,

    /// for white back & menu button
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  /// design size
  static const designSize = Size(375, 812);

  /// apply ui preference
  static void init() {
    const tag = "apply";
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SystemChrome.setSystemUIOverlayStyle(_overlayStyle);
        SystemChrome.setPreferredOrientations(_orientations);
        SystemChrome.setEnabledSystemUIMode(_uiMode, overlays: _overlays);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: kIsWeb ? [] : _overlays);
      });
    } catch (e) {
      _log.e(tag, "init app settings failed", e);
    }
  }

  /// apply ui preference
  static void makeNavigationBarTransparent() {
    const tag = "apply";
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SystemChrome.setSystemUIOverlayStyle(_overlayStyle.copyWith(
          systemNavigationBarColor: Colors.transparent,
        ));
      });
    } catch (e) {
      _log.e(tag, "apply app settings failed", e);
    }
  }

  static void makeNavigationBarBlack() {
    const tag = "makeNavigationBarBlack";
    try {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SystemChrome.setSystemUIOverlayStyle(_overlayStyle);
      });
    } catch (e) {
      _log.e(tag, tryCatch, e);
    }
  }
}
