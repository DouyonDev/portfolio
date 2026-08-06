import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/utils.dart';

class ParticleBackground extends StatefulWidget {
  @override
  _ParticleBackgroundState createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  List<Particle> particles = [];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..repeat();

    // Générer les particules
    particles = List.generate(40, (index) => Particle());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          painter: ParticlePainter(particles),
          size: Size.infinite,
        );
      },
    );
  }
}

class Particle {
  double x = Random().nextDouble();
  double y = Random().nextDouble();
  double speed = Random().nextDouble() * 0.002;
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.2);

    for (var p in particles) {
      p.y -= p.speed;
      if (p.y < 0) p.y = 1;

      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}