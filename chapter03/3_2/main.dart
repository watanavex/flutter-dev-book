import 'package:flutter/material.dart';

void main() {
  runApp(
    const Column(
      children: [
        AnimalView(
          text: 'mouse',
          color: Colors.yellow,
        ),
        AnimalView(
          text: 'lizard',
          color: Colors.red,
        ),
      ],
    ),
  );
}

class AnimalView extends StatelessWidget {
  const AnimalView({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          text,
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}
