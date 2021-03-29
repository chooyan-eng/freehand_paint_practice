import 'dart:math';

import 'package:flutter/material.dart';

class FreehandPainter extends CustomPainter {
  final List<List<Point<double>>> strokes;

  FreehandPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 4; // configure style
    for (final stroke in strokes) {
      for (var i = 0; i < stroke.length - 1; i++) {
        final from = stroke[i];
        final to = stroke[i + 1];
        canvas.drawLine(Offset(from.x, from.y), Offset(to.x, to.y), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
