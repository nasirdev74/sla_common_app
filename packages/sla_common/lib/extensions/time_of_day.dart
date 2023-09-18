import 'package:flutter/material.dart';

extension TimeOfDayExt on TimeOfDay {
  int get toMinutes => hour * 60 + minute;

  int diffMin(TimeOfDay td) {
    return td.toMinutes - toMinutes;
  }
}
