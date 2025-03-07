import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JsonEx extends StatefulWidget {
  const JsonEx({super.key});

  @override
  State<JsonEx> createState() => _JsonExState();
}

class _JsonExState extends State<JsonEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Json'),
            Lottie.asset(
              "assets/jsons/check.json",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Lottie.asset(
              "assets/jsons/circulo.json",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }
}
