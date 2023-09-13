import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sla_common/constants/theme.dart';

const inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(DEFAULT_BORDER_RADIUS)),
  borderSide: BorderSide(color: Colors.transparent),
);

final List<TextInputFormatter> noSpaceFormatter = [FilteringTextInputFormatter.deny(' ')];
final List<TextInputFormatter> digitOnlyFormatter = [FilteringTextInputFormatter.digitsOnly];
