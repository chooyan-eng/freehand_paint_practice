import 'dart:math';

import 'package:drawapp_practice/freehand_painter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _strokes = <List<Point<double>>>[];
  List<Point<double>> _currentStroke;

  void _start() {
    _currentStroke = <Point<double>>[];
    _strokes.add(_currentStroke);
  }

  void _add(double x, double y) {
    setState(() {
      _currentStroke?.add(Point(x, y));
    });
  }

  void _end() {
    _currentStroke = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DrawApp Practice'),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 32),
            const Text('DRAW WHAT YOU WANT!'),
            const SizedBox(height: 120),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: GestureDetector(
                  onPanStart: (details) => _start(),
                  onPanUpdate: (details) {
                    _add(
                      details.localPosition.dx,
                      details.localPosition.dy,
                    );
                  },
                  onPanEnd: (details) => _end(),
                  child: CustomPaint(
                    painter: FreehandPainter(_strokes),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
