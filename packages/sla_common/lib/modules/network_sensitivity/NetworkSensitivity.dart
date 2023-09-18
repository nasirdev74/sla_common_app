import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class NetworkSensitivity extends StatelessWidget {
  const NetworkSensitivity({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: NetworkStatus.unavailable,
      stream: NetworkUtils.networkStatus.stream,
      builder: (_, AsyncSnapshot<NetworkStatus> snapshot) {
        final data = snapshot.requireData;
        if (data == NetworkStatus.available) return child;
        return NoInternetView();
      },
    );
  }
}
