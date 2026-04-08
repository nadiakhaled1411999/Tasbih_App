
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tasbih_app/features/tasbih/screens/sentry_splash_screen.dart';
import 'package:tasbih_app/features/tasbih/screens/test_sentry.dart';
import 'features/tasbih/screens/tasbih_screen.dart';

class TasbihApp extends StatelessWidget {
  const TasbihApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasbih App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
       // This observer builds Breadcrumbs to track user navigation between screens 🗺️
      navigatorObservers: [SentryNavigatorObserver()],
      home: const  SentrySplashScreen(),
    );
  }
}
