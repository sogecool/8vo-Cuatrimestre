import 'package:flutter/material.dart';

class GifsEx extends StatefulWidget {
  const GifsEx({super.key});

  @override
  State<GifsEx> createState() => _GifExState();
}

class _GifExState extends State<GifsEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('Ejemplo de Gifs'),
            Image.asset(
              "assets/gif/kawaii.gif",
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Image.asset(
              "assets/gif/luffy.gif",
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
