import 'package:flutter/material.dart';

class RingPainter extends CustomPainter {
  final Color color;
  final double thickness;

  RingPainter({
    required this.color,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = (size.width - thickness) / 2;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}