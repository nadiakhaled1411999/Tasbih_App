import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasbih_app/core/constants/tasbih_constants.dart';
import 'package:tasbih_app/features/tasbih/widgets/kaaba_particle_painter.dart';
import 'package:tasbih_app/models/kaaba_particle.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  final List<KaabaParticle> _particles = [];
  late AnimationController _controller;
  final Random _random = Random();
  int _currentPhraseIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: TasbihConstants.animationDurationMs),
    )..addListener(() {
        setState(() {
          _updateParticles();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spawnParticles(Offset center) {
    _particles.clear();
    final size = MediaQuery.of(context).size;

    for (int i = 0; i < TasbihConstants.particleCount; i++) {
      final startFromCenter = _random.nextBool();
      Offset startPos;
      Offset velocity;

      if (startFromCenter) {
        final angle = _random.nextDouble() * 2 * pi;
        final speed = TasbihConstants.particleMinSpeed +
            _random.nextDouble() * TasbihConstants.particleMaxSpeed;
        startPos = center;
        velocity = Offset(cos(angle) * speed, sin(angle) * speed);
      } else {
        startPos = Offset(
          _random.nextDouble() * size.width,
          _random.nextDouble() * size.height,
        );
        final angle = _random.nextDouble() * 2 * pi;
        final speed = TasbihConstants.particleRandomMinSpeed +
            _random.nextDouble() * TasbihConstants.particleRandomMaxSpeed;
        velocity = Offset(cos(angle) * speed, sin(angle) * speed);
      }

      _particles.add(KaabaParticle(
        position: startPos,
        velocity: velocity,
        size: TasbihConstants.particleMinSize +
            _random.nextDouble() * TasbihConstants.particleMaxSize,
        opacity: 1.0,
        rotation: _random.nextDouble() * pi,
        rotationSpeed: (_random.nextDouble() - 0.5) * 6,
      ));
    }
  }

  void _updateParticles() {
    final t = _controller.value;
    for (final p in _particles) {
      p.position += p.velocity * 0.016;
      p.velocity = Offset(p.velocity.dx * 0.97, p.velocity.dy * 0.97);
      p.opacity = (1 - t * 1.2).clamp(0.0, 1.0);
      p.rotation += p.rotationSpeed * 0.016;
    }
    if (_controller.value >= 1.0) {
      _particles.clear();
    }
  }

  void _onTap() {
    HapticFeedback.lightImpact();

    setState(() {
      _count++;
      if (_count > TasbihConstants.maxCount) {
        _count = 1;
        _currentPhraseIndex =
            (_currentPhraseIndex + 1) % TasbihConstants.phrases.length;
      }
    });

    final size = MediaQuery.of(context).size;
    _spawnParticles(Offset(size.width / 2, size.height * 0.6));
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TasbihConstants.backgroundColor,
      body: Stack(
        children: [
          if (_particles.isNotEmpty)
            Positioned.fill(
              child: CustomPaint(
                painter: KaabaParticlePainter(_particles),
              ),
            ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      TasbihConstants.phrases[_currentPhraseIndex],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: TasbihConstants.textColor,
                        fontSize: 36,
                        height: 2.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  GestureDetector(
                    onTap: _onTap,
                    child: const CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage("assets/images/karim.png"),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "اذكر ربنا… ومتنساش تدعي للبشمهندسة ناديه",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: TasbihConstants.subtitleColor,
                          shadows: [
                            Shadow(
                              blurRadius: 2.0,
                              color: Colors.black12,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
