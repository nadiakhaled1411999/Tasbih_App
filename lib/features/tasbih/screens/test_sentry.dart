import 'package:flutter/material.dart';

class TestSentry extends StatelessWidget {
  const TestSentry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 78, 60, 105),
        title: const Text('Test Sentry', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          throw StateError('This is test exception');
        },
        child: const Text('Verify Sentry Setup'),
      )),
    );
  }
}
