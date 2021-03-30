import 'dart:ui';

import 'package:drawapp_practice/stroke.dart';
import 'package:flutter/material.dart';

/// [CustomPainter] for drawing lines by hand
class FreehandPainter extends CustomPainter {
  final List<Stroke> strokes;

  FreehandPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    // not to draw outside of the CustomPaint
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // fill background color with Colors.white, otherwise background would be transparent
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = Colors.white,
    );
    for (final stroke in strokes) {
      // draw line with given configurations
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
