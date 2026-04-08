import 'package:flutter/material.dart';
import 'package:tasbih_app/core/constants/tasbih_constants.dart';
import 'package:tasbih_app/features/tasbih/screens/tasbih_screen.dart';
import 'dart:async';



class TasbihSplashScreen extends StatefulWidget {
  const TasbihSplashScreen({super.key});

  @override
  State<TasbihSplashScreen> createState() => _TasbihSplashScreenState();
}

class _TasbihSplashScreenState extends State<TasbihSplashScreen> {
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

    Timer(const Duration(seconds: 6), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const TasbihScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  TasbihConstants.backgroundColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.radar_rounded, size: 80, color: TasbihConstants.textColor,),
              SizedBox(height: 20),
              Text(
                'بسم الله الرحمن الرحيم',
                style: TextStyle(
                  fontSize:20,
                  fontWeight: FontWeight.bold,
                  color: TasbihConstants.textColor,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'أذكر الله يذكرك',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
