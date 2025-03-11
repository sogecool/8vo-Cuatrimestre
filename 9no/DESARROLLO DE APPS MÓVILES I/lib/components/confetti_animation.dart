import 'package:flutter/material.dart';
import 'dart:math' as math;

class ConfettiAnimation extends StatefulWidget {
  final VoidCallback? onComplete;

  const ConfettiAnimation({super.key, this.onComplete});

  @override
  State<ConfettiAnimation> createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation>
    with SingleTickerProviderStateMixin {
  static const double _gravity =
      0.15; // Gravedad que afecta la aceleración vertical
  late AnimationController _controller;
  late List<Confetti> _confettis;
  final int _confettiCount = 50;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && widget.onComplete != null) {
        widget.onComplete!();
      }
    });

    // Generar confeti con propiedades aleatorias
    _generateConfetti();

    // Iniciar la animación automáticamente
    _controller.forward();
  }

  void _generateConfetti() {
    final random = math.Random();
    _confettis = List.generate(_confettiCount, (index) {
      // Posición inicial (siempre en el centro superior)
      final x = 0.5;
      final y = 0.0;

      // Velocidad y dirección aleatorias
      final speedX = (random.nextDouble() * 2 - 1) * 0.5; // -0.5 a 0.5
      final speedY = 0.5 + random.nextDouble() * 0.5; // 0.5 a 1.0

      // Tamaño aleatorio
      final size = 5.0 + random.nextDouble() * 10.0; // 5 a 15

      // Color aleatorio
      final colors = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.orange,
        Colors.purple,
        Colors.pink,
        Colors.teal,
      ];
      final color = colors[random.nextInt(colors.length)];

      // Rotación aleatoria
      final rotationSpeed = (random.nextDouble() * 2 - 1) * 0.1; // -0.1 a 0.1

      // Forma aleatoria
      final shape =
          random.nextBool() ? ConfettiShape.circle : ConfettiShape.square;

      return Confetti(
        x: x,
        y: y,
        speedX: speedX,
        speedY: speedY,
        size: size,
        color: color,
        rotationSpeed: rotationSpeed,
        shape: shape,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // Actualizar la posición de cada confeti según el progreso
        for (var confetti in _confettis) {
          // Utilizamos el valor del controlador como progreso de tiempo
          final progress = _controller.value;
          // Añadimos gravedad para efecto más realista
          confetti.y +=
              confetti.speedY * progress + _gravity * progress * progress;
          confetti.x += confetti.speedX * progress;
          confetti.rotation += confetti.rotationSpeed * progress * 10;
        }

        return CustomPaint(
          painter: _ConfettiPainter(
            confettis: _confettis,
            progress: _controller.value,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

enum ConfettiShape { circle, square }

class Confetti {
  double x; // Posición horizontal normalizada (0-1)
  double y; // Posición vertical normalizada (0-1)
  final double speedX; // Velocidad horizontal
  final double speedY; // Velocidad vertical
  final double size; // Tamaño
  final Color color; // Color
  double rotation = 0.0;
  final double rotationSpeed; // Velocidad de rotación
  final ConfettiShape shape; // Forma del confeti

  Confetti({
    required this.x,
    required this.y,
    required this.speedX,
    required this.speedY,
    required this.size,
    required this.color,
    required this.rotationSpeed,
    required this.shape,
  });

  // Actualiza la posición del confeti basado en el progreso
  void update(double progress, double deltaTime) {
    // La física se simplifica para una caída con aceleración
    x += speedX * deltaTime;
    y += speedY * deltaTime;

    // Añade rotación
    rotation += rotationSpeed * deltaTime;
  }
}

// CustomPainter para dibujar los confetis
class _ConfettiPainter extends CustomPainter {
  final List<Confetti> confettis;
  final double progress;

  _ConfettiPainter({
    required this.confettis,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var confetti in confettis) {
      // Calcular posición en el canvas
      final x = confetti.x * size.width;
      final y = confetti.y * size.height;

      // Guardar el estado actual del canvas
      canvas.save();

      // Traslada al punto donde se dibujará el confeti
      canvas.translate(x, y);

      // Aplica rotación
      canvas.rotate(confetti.rotation);

      // Dibuja la forma según corresponda
      final paint = Paint()
        ..color = confetti.color.withOpacity(1.0 - progress * 0.5);

      if (confetti.shape == ConfettiShape.circle) {
        canvas.drawCircle(
          Offset.zero,
          confetti.size / 2,
          paint,
        );
      } else {
        canvas.drawRect(
          Rect.fromCenter(
            center: Offset.zero,
            width: confetti.size,
            height: confetti.size,
          ),
          paint,
        );
      }

      // Restaura el estado del canvas
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
