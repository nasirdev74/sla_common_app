import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class HeadLine2 extends StatelessWidget {
  const HeadLine2({
    super.key,
    this.headline2 = "Headline2",
  });

  final String headline2;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline2,
      style: context.headline2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
