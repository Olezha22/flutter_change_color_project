import 'dart:math';
import 'package:flutter/material.dart';
import 'package:test_project/home/ui/widget/circle_reveal_painter.dart';

class AnimatedColorBackground extends StatelessWidget {
  const AnimatedColorBackground({
    super.key,
    required Animation<double> radiusAnimation,
    required this.screenSize,
    required Offset tapPosition,
    required this.targetColor,
  }) : _radiusAnimation = radiusAnimation,
       _tapPosition = tapPosition;

  final Animation<double> _radiusAnimation;
  final Size screenSize;
  final Color targetColor;
  final Offset _tapPosition;
  @override
  Widget build(BuildContext context) {
    final double maxRadius =
        1.5 * sqrt(pow(screenSize.width, 2) + pow(screenSize.height, 2));
    return AnimatedBuilder(
      animation: _radiusAnimation,
      builder: (context, _) {
        return CustomPaint(
          size: screenSize,
          painter: CircleRevealPainter(
            center: _tapPosition,
            radius: _radiusAnimation.value * maxRadius,
            targetColor: targetColor,
          ),
        );
      },
    );
  }
}
