import 'state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sla_logger/sla_logger.dart';
import 'package:sla_common/sla_common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final noInternetProvider = StateNotifierProvider<_NoInternetLogic, NoInternetState>(
    (ref) => _NoInternetLogic(NoInternetState.init(), ref));

class _NoInternetLogic extends StateNotifier<NoInternetState> {
  final _log = AppLog(_NoInternetLogic);

  /// build context from route
  BuildContext? _context;

  /// state notifier reference
  late StateNotifierProviderRef _ref;

  _NoInternetLogic(state, this._ref) : super(state) {
    // _context = _ref.watch(routerProvider).routerDelegate.navigatorKey.currentContext;
  }

  reCheck() async {
    const tag = "reCheck";
    try {
      // final currentPath = _ref.read(routerProvider).location;
      final currentPath = "";
      final status = await Connectivity().checkConnectivity();
      if (status == ConnectivityResult.mobile ||
          status == ConnectivityResult.wifi ||
          status == ConnectivityResult.ethernet) {
        if (currentPath == NoInternetPresentation.route) {
          // _context?.go(SplashPresentation.route);
        }
      }
    } catch (e) {
      _log.e(tag, tryCatch, e);
    }
  }

  _listenForNetworkChanges() async {
    const tag = "_listenForNetworkChanges";
    try {
      Connectivity().onConnectivityChanged.listen((status) {
        // final currentPath = _ref.read(routerProvider).location;
        final currentPath = "";
        if (status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi ||
            status == ConnectivityResult.ethernet) {
          if (currentPath == NoInternetPresentation.route) {
            // _context?.go(SplashPresentation.route);
          }
        } else {
          _context?.go(NoInternetPresentation.route);
        }
      });
    } catch (e) {
      _log.e(tag, tryCatch, e);
    }
  }

  init() async {
    const tag = "init";
    try {
      _listenForNetworkChanges();
    } catch (e) {
      _log.e(tag, tryCatch, e);
    }
  }
}
