import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class SubTitle1 extends StatelessWidget {
  const SubTitle1({
    super.key,
    this.subtitle1 = "",
  });

  final String subtitle1;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle1,
      style: context.subtitle1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
