import 'package:drawapp_practice/stroke.dart';
import 'package:flutter/material.dart';

class FreehandPainter extends CustomPainter {
  final List<Stroke> strokes;

  FreehandPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = stroke.width
        ..color = stroke.color
        ..strokeCap = StrokeCap.round;
      for (var i = 0; i < stroke.points.length - 1; i++) {
        final from = stroke.points[i];
        final to = stroke.points[i + 1];
        canvas.drawLine(Offset(from.x, from.y), Offset(to.x, to.y), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
