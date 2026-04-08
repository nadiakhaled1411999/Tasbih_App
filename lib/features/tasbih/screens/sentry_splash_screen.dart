import 'package:flutter/material.dart';
import 'dart:async';

import 'package:tasbih_app/features/tasbih/screens/test_sentry.dart';

class SentrySplashScreen extends StatefulWidget {
  const SentrySplashScreen({super.key});

  @override
  State<SentrySplashScreen> createState() => _SentrySplashScreenState();
}

class _SentrySplashScreenState extends State<SentrySplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>  const TestSentry()
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 60, 105),
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.radar_rounded, size: 80, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Sentry',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Observability Powered by Sentry',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}