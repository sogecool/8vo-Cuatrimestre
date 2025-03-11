import 'package:flutter/material.dart';

class FadePageTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  FadePageTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 400),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

// También podemos implementar más tipos de transiciones personalizadas
class SlidePageTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;
  final SlideDirection direction;

  SlidePageTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 400),
    this.direction = SlideDirection.rightToLeft,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset.zero;

            switch (direction) {
              case SlideDirection.rightToLeft:
                begin = const Offset(1.0, 0.0);
                break;
              case SlideDirection.leftToRight:
                begin = const Offset(-1.0, 0.0);
                break;
              case SlideDirection.bottomToTop:
                begin = const Offset(0.0, 1.0);
                break;
              case SlideDirection.topToBottom:
                begin = const Offset(0.0, -1.0);
                break;
            }

            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: duration,
        );
}

enum SlideDirection {
  rightToLeft,
  leftToRight,
  bottomToTop,
  topToBottom,
}

// Ahora creamos una clase para combinar diferentes efectos
class ScaleAndFadeTransition extends PageRouteBuilder {
  final Widget page;
  final Duration duration;

  ScaleAndFadeTransition({
    required this.page,
    this.duration = const Duration(milliseconds: 500),
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var curve = Curves.easeInOut;
            var curveTween = CurveTween(curve: curve);

            var fadeTween =
                Tween<double>(begin: 0.0, end: 1.0).chain(curveTween);
            var scaleTween =
                Tween<double>(begin: 0.8, end: 1.0).chain(curveTween);

            return FadeTransition(
              opacity: animation.drive(fadeTween),
              child: ScaleTransition(
                scale: animation.drive(scaleTween),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );
}
