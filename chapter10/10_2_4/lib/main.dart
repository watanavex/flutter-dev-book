import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: CountButton(),
      ),
    );
  }
}

class CountButton extends StatefulWidget {
  const CountButton({super.key});
  @override
  State createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('count = $_counter'),
      onPressed: () => _increment(),
    );
  }
}
