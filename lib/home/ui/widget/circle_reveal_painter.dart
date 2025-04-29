import 'package:flutter/material.dart';

class CircleRevealPainter extends CustomPainter {
  final Offset center;
  final double radius;
  final Color targetColor;

  CircleRevealPainter({
    required this.center,
    required this.radius,
    required this.targetColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..shader = RadialGradient(
            colors: [
              targetColor.withValues(alpha: 1.0),
              targetColor.withValues(alpha: 1.0),
              targetColor.withValues(alpha: 0.0),
            ],
            stops: const [0.0, 0.6, 1.0],
          ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
