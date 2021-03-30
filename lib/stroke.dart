import 'dart:math';

import 'package:flutter/material.dart';

class Stroke {
  final List<Point<double>> points = [];
  final Color color;
  final double width;

  Stroke({
    this.color = Colors.black,
    this.width = 4,
  });
}
