import 'dart:math';

import 'package:drawapp_practice/freehand_painter.dart';
import 'package:drawapp_practice/stroke.dart';
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
  var _currentColor = Colors.black;
  var _currentWidth = 4.0;

  final _strokes = <Stroke>[];
  void _start() {
    _strokes.add(Stroke(
      color: _currentColor,
      width: _currentWidth,
    ));
  }

  void _add(double x, double y) {
    setState(() {
      _strokes.last.points.add(Point(x, y));
    });
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
                  child: CustomPaint(
                    painter: FreehandPainter(_strokes),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              children: [
                Colors.black,
                Colors.blue,
                Colors.red,
                Colors.green,
                Colors.yellow
              ].map(
                (color) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentColor = color;
                      });
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: color,
                        child: Center(
                          child: _currentColor == color
                              ? Icon(
                                  Icons.brush,
                                  color: Colors.white,
                                )
                              : SizedBox.shrink(),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 32),
            Slider(
              max: 40,
              min: 1,
              value: _currentWidth,
              onChanged: (value) {
                setState(() {
                  _currentWidth = value;
                });
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
