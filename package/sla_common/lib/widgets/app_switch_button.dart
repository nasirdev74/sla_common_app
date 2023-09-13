import 'package:flutter/material.dart';
import 'package:sla_common/sla_common.dart';

class AppSwitchButton extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;

  const AppSwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.color = AppColor.primary,
  }) : super(key: key);

  @override
  AppSwitchButtonState createState() => AppSwitchButtonState();
}

class AppSwitchButtonState extends State<AppSwitchButton>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_animationController != null) {
      return AnimatedBuilder(
        animation: _animationController!,
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (_animationController!.isCompleted) {
                _animationController!.reverse();
              } else {
                _animationController!.forward();
              }
              widget.value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            },
            child: Container(
              width: 52,
              height: 29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: widget.value == false ? Colors.grey : widget.color,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                  right: 4,
                  left: 4,
                ),
                child: Container(
                  alignment: widget.value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
