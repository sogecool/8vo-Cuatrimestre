import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoadingAnimation extends StatefulWidget {
  final Color color;
  final double size;

  const LoadingAnimation({
    super.key,
    this.color = Colors.purple,
    this.size = 50.0,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(); // Repetir animación indefinidamente

    // Animación de tamaño (pulsación)
    _sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.2),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Animación de rotación
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi, // Rotación completa (360 grados)
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
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
        return Center(
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Transform.scale(
              scale: _sizeAnimation.value,
              child: CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _LoadingPainter(
                  color: widget.color,
                  progress: _controller.value,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LoadingPainter extends CustomPainter {
  final Color color;
  final double progress;

  _LoadingPainter({
    required this.color,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Círculo base (fondo)
    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Arco animado (indicador de progreso)
    final arcPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    // Dibuja un arco que va avanzando con la animación
    final startAngle = -math.pi / 2; // Comienza desde arriba
    final sweepAngle = 2 * math.pi * progress; // Avanza según el progreso

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      arcPaint,
    );

    // Dibuja pequeños círculos en el arco para un efecto decorativo
    final dotsCount = 8;
    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (int i = 0; i < dotsCount; i++) {
      // Solo muestra los puntos que ya ha alcanzado el arco
      if (i / dotsCount <= progress) {
        final angle = startAngle + (2 * math.pi * i / dotsCount);
        final dotCenter = Offset(
          center.dx + radius * math.cos(angle),
          center.dy + radius * math.sin(angle),
        );

        // El tamaño del punto varía según la proximidad al progreso actual
        final dotProgress = (progress * dotsCount) % 1.0;
        final distanceToProgress = (i - progress * dotsCount).abs();
        final dotSize = distanceToProgress < 1.0
            ? 4.0 + (1.0 - distanceToProgress) * 3.0
            : 4.0;

        canvas.drawCircle(dotCenter, dotSize, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_LoadingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
