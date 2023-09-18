import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class HeadLine1 extends StatelessWidget {
  const HeadLine1({
    super.key,
    this.headline1 = "Headline1",
  });

  final String headline1;

  @override
  Widget build(BuildContext context) {
    return Text(
      headline1,
      style: context.headline1,
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
    );
  }
}
