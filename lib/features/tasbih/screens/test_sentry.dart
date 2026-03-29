import 'package:flutter/material.dart';

class TestSentry extends StatelessWidget {
  const TestSentry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Sentry'),
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
