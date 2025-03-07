
import 'package:dev/views/Recursos.dart';
import 'package:dev/views/gifs_ex.dart';
import 'package:dev/views/json_ex.dart';
import 'package:dev/views/page_transitions.dart';
import 'package:flutter/material.dart';

import 'ejemplos/cuadrado.dart';
import 'ejemplos/triangulo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}