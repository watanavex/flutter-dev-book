import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Edit Snap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'こんにちは！\n今日は${DateTime.now()}です。',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              child: const Text('開始する'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
