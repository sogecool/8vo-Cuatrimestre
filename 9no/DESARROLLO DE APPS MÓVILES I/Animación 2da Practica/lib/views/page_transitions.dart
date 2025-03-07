import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aarón Hernández García")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade, // Tipo de animación
                    child: ScreenOne(),
                  ),
                );
              },
              child: Text("Transicion de pantalla -> Fade"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft, // Otra animación
                    child: ScreenTwo(),
                  ),
                );
              },
              child: Text("Transicion de pantalla -> Right to Left"),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 1")),
      body: Center(
        child: Text("Bienvenido a la Pantalla 1", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pantalla 2")),
      body: Center(
        child: Text("Bienvenido a la Pantalla 2", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
