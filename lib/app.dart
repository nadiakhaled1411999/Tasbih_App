
import 'package:flutter/material.dart';
import 'features/tasbih/screens/tasbih_screen.dart';

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
