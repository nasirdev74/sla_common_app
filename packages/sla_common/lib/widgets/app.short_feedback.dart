import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class AppShortFeedback extends StatelessWidget {
  const AppShortFeedback({
    Key? key,
    required this.message,
    this.isError = false,
  }) : super(key: key);

  final String message;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: context.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.72,
          vertical: 13,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              width: 4.49,
              color: isError ? const Color(0xFFFE0002) : const Color(0xFF3FD785),
            ),
          ),
        ),
        child: Text(
          message.capitalize ?? '',
          style: style500_15Black.copyWith(
            color: isError ? const Color(0xFFFE0002) : const Color(0xFF3FD785),
          ),
        ),
      ),
    );
  }
}
