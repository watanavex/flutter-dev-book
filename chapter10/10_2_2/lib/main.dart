import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      /* 
      ◆ Align
      alignmentパラメータに応じて子ウィジェットを配置するWidget */ 
      body: Align( // Align
        alignment: Alignment.bottomRight, // 右下寄せ
        child: ElevatedButton(
          onPressed: (() {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const DetailScreen()));
          }),
          child: const Text('Go to detail'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
      ),
      body: const Center(
        child: Text('Detail'),
      ),
    );
  }
}
