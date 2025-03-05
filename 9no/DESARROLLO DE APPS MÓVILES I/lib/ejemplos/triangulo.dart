import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(TrianguloApp());

class TrianguloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrianguloScreen(),
    );
  }
}

class TrianguloScreen extends StatefulWidget {
  @override
  _TrianguloScreenState createState() => _TrianguloScreenState();
}

class _TrianguloScreenState extends State<TrianguloScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Triángulo Rotando - Aaron Hdz")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: CustomPaint(
                size: Size(100, 100),
                painter: TrianguloPainter(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.green;
    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
