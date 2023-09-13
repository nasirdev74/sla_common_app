import 'package:flutter/material.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({
    required this.child,
    this.color = Colors.black,
    this.delay = const Duration(),
    this.minRadius = 60,
    this.ripplesCount = 5,
    this.duration = const Duration(milliseconds: 2300),
    Key? key,
  }) : super(key: key);

  final Widget child;

  final Duration delay;

  final double minRadius;

  final Color color;

  final int ripplesCount;

  final Duration duration;

  @override
  RippleAnimationState createState() => RippleAnimationState();
}

class RippleAnimationState extends State<RippleAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _controller?.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: CirclePainter(
          _controller,
          color: widget.color,
          minRadius: widget.minRadius,
          wavesCount: widget.ripplesCount + 2,
        ),
        child: widget.child,
      );

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.wavesCount,
    required this.color,
    this.minRadius,
  }) : super(repaint: _animation);

  final Color color;

  final double? minRadius;

  final int wavesCount;

  final Animation<double>? _animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(canvas, rect, minRadius, wave, _animation!.value, wavesCount, color);
    }
  }

  void circle(Canvas canvas, Rect rect, double? minRadius, int wave, double value, int? length,
      Color circleColor) {
    Color color = circleColor;
    double r;
    if (wave != 0) {
      final double opacity = (1 - ((wave - 1) / length!) - value).clamp(0.0, 1.0);
      color = color.withOpacity(opacity);

      r = minRadius! * (1 + (wave * value)) * value;
      final Paint paint = Paint()..color = color;
      canvas.drawCircle(rect.center, r, paint);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
