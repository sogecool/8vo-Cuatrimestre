import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Recursos extends StatefulWidget {
  const Recursos({super.key});

  @override
  State<Recursos> createState() => _RecursosState();
}

class _RecursosState extends State<Recursos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Recursos'),
            Image.asset(
              "assets/images/pato.webp",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "assets/gif/kawaii.gif",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            const Text('Recursos'),
            Lottie.asset(
              'assets/jsons/animacion1.json',
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            ),
            Lottie.asset(
              'assets/jsons/animacion2.json',
              width: 200,
              height: 200,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}