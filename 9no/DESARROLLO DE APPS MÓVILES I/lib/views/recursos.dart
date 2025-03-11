import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoadingPage.dart';


class Recursos extends StatefulWidget {
  const Recursos({super.key});

  @override
  State<Recursos> createState() => _RecursosState();
}

class _RecursosState extends State<Recursos> {

  void Logeame() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('tas_logeado', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Loadingpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Letras blancas
                ),
              ),
              const SizedBox(height: 30),

              // Campo de correo
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white), // Texto blanco
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: const TextStyle(color: Colors.white), // Etiqueta blanca
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white), // Borde blanco
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue), // Borde azul al seleccionar
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campo de contraseña
              TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.white), // Texto blanco
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: const TextStyle(color: Colors.white), // Etiqueta blanca
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white), // Borde blanco
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue), // Borde azul al seleccionar
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Botón de login
              GestureDetector(
                onTap: Logeame,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fondo blanco
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Logeame",
                      style: TextStyle(
                        color: Colors.black, // Texto negro
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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