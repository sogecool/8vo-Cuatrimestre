import 'package:app_flutter/views/LoadingPage.dart';
import 'package:app_flutter/views/home.dart';
import 'package:app_flutter/views/recursos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Recursos(),
    );
  }
}
