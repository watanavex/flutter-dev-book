import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'apiEndpoint = ${const String.fromEnvironment('apiEndpoint')}'),
            Text('logLevel = ${const int.fromEnvironment('logLevel')}'),
            Text(
                'enableDebugMenu = ${const bool.fromEnvironment('enableDebugMenu')}'),
          ],
        ),
      ),
    );
  }
}
