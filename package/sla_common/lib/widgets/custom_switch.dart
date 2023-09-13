import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Color color;
  final double width;
  final double height;
  final double switchHeight;
  final double switchWidth;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    Key? key,
    required this.value,
    required this.color,
    required this.width,
    required this.height,
    required this.switchHeight,
    required this.switchWidth,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: widget.color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 3.0, left: 3.0),
              child: Container(
                alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth,
                  height: widget.switchHeight,
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
  }
}
