import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class BodyText2 extends StatelessWidget {
  const BodyText2({
    super.key,
    this.bodyText2 = "BodyText2",
  });

  final String bodyText2;

  @override
  Widget build(context) {
    return Text(
      bodyText2,
      style: context.bodyText2,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
