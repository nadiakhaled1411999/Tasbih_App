import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const TasbihApp());
}

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سبحة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TasbihScreen(),
    );
  }
}

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

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  List<KaabaParticle> _particles = [];
  late AnimationController _controller;
  final Random _random = Random();

  final List<String> _phrases = [
    'سُبْحَانَ اللَّهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللَّهُ',
  ];
  int _currentPhraseIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
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

    for (int i = 0; i < 30; i++) {
      final startFromCenter = _random.nextBool();
      Offset startPos;
      Offset velocity;

      if (startFromCenter) {
        final angle = _random.nextDouble() * 2 * pi;
        final speed = 200 + _random.nextDouble() * 400;
        startPos = center;
        velocity = Offset(cos(angle) * speed, sin(angle) * speed);
      } else {
        startPos = Offset(
          _random.nextDouble() * size.width,
          _random.nextDouble() * size.height,
        );
        final angle = _random.nextDouble() * 2 * pi;
        final speed = 50 + _random.nextDouble() * 150;
        velocity = Offset(cos(angle) * speed, sin(angle) * speed);
      }

      _particles.add(KaabaParticle(
        position: startPos,
        velocity: velocity,
        size: 24 + _random.nextDouble() * 40,
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
      if (_count > 33) {
        _count = 1;
        _currentPhraseIndex = (_currentPhraseIndex + 1) % _phrases.length;
      }
    });

    final size = MediaQuery.of(context).size;
    _spawnParticles(Offset(size.width / 2, size.height * 0.6));
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0a1a10),
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
                      _phrases[_currentPhraseIndex],
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(
                        color: Color(0xFFf0e6c0),
                        fontSize: 36,
                        height: 2.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  GestureDetector(
                      onTap: _onTap,
                      child: const CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage("assets/images/karim.png"),
                      )),
                  const Spacer(),
                  const Text(
                    "اذكر ربنا يا كريم.. ومتنساش تدعي لأختك",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black12,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
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
