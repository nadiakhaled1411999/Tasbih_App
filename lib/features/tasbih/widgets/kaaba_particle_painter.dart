import 'package:flutter/material.dart';
import 'package:tasbih_app/models/kaaba_particle.dart';

class KaabaParticlePainter extends CustomPainter {
  final List<KaabaParticle> particles;

  KaabaParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      if (p.opacity <= 0) continue;

      canvas.save();
      canvas.translate(p.position.dx, p.position.dy);
      canvas.rotate(p.rotation);

      final textPainter = TextPainter(
        text: TextSpan(
          text: '🕋',
          style: TextStyle(fontSize: p.size),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      canvas.saveLayer(
        Rect.fromCircle(
          center: Offset(-textPainter.width / 2, -textPainter.height / 2),
          radius: p.size,
        ),
        Paint()..color = Colors.white.withOpacity(p.opacity),
      );

      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

      canvas.restore();
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
