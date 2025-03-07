import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(CuadradoApp());

class CuadradoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CuadradoScreen(),
    );
  }
}

class CuadradoScreen extends StatefulWidget {
  @override
  _CuadradoScreenState createState() => _CuadradoScreenState();
}

class _CuadradoScreenState extends State<CuadradoScreen> {
  Color _color = Colors.blue;

  void _cambiarColor() {
    setState(() {
      _color = Color(Random().nextInt(0xFFFFFF) + 0xFF000000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cuadrado Animado - Aaron Hdz")),
      body: Center(
        child: GestureDetector(
          onTap: _cambiarColor,
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: 100,
            height: 100,
            color: _color,
            alignment: Alignment.center,
            child: Text(
              "Aaron Hdz",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
