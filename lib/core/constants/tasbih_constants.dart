 

import 'package:flutter/material.dart';

class TasbihConstants {
  //! عداد السبحة
  static const int maxCount = 33;

  //! الـ particles
  static const int particleCount = 30;
  static const int animationDurationMs = 1500;
  static const double particleMinSize = 24;
  static const double particleMaxSize = 40;
  static const double particleMinSpeed = 200;
  static const double particleMaxSpeed = 400;
  static const double particleRandomMinSpeed = 50;
  static const double particleRandomMaxSpeed = 150;

  //! الألوان
  static const Color backgroundColor = Color(0xFF0a1a10);
  static const Color textColor = Color(0xFFf0e6c0);
  static const Color subtitleColor = Colors.brown;

  //! الأذكار
  static const List<String> phrases = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
  ];
}
