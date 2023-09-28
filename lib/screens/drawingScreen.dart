import 'package:flutter/material.dart';


class DrawingScreen extends StatefulWidget {
  DrawingScreen({Key? key});

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {

  final _strokes = <Path>[];

  void _startStroke(double x, double y)
  {
      _strokes.add(Path()..moveTo(x,y));
  }
  void _moveStroke(double x, double y)
  {
    setState(() {
      _strokes.last.lineTo(x, y);
    });

  }

  void _clearStroke()
  {
    setState(() {
      _strokes.clear();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawing Area'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                color: Colors.red,
                height: 46,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {_clearStroke();}, icon: const Icon(Icons.clear)),
                  ],
                ),
              ),
              GestureDetector(
                onPanDown: (details) {
                  _startStroke(details.localPosition.dx, details.localPosition.dy);
                },
                onPanUpdate: (details) {
                  _moveStroke(details.localPosition.dx, details.localPosition.dy);
                },
                child: Container(
                  color: Colors.grey,
                  width: 350,
                  height: 500,
                child: CustomPaint(
                  size: const Size(350,500),
                  painter: MyPainter(_strokes),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<Path> strokes;
  MyPainter(this.strokes);

  @override
  void paint(Canvas canvas, Size size) {
    for (final stroke in strokes) {
      final paint = Paint()
        ..strokeWidth = 2
        ..color = Colors.teal
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;
      canvas.drawPath(stroke, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
