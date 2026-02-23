import 'package:flutter/material.dart';

class KaabaParticle {
  Offset position;
  Offset velocity;
  double size;
  double opacity;
  double rotation;
  double rotationSpeed;

  KaabaParticle({
    required this.position,
    required this.velocity,
    required this.size,
    required this.opacity,
    required this.rotation,
    required this.rotationSpeed,
  });
}
