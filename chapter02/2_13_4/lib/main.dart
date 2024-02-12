import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

// 引数が素数かどうか判定する関数
bool isPrime(int value) {
  if (value == 1) {
    return false;
  }
  for (var i = 2; i < value; ++i) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            ElevatedButton(
                onPressed: () async {
                  const number = 67280421310721;
                  final result = await compute((number) {
                    return isPrime(number);
                  }, number);
                  print('$number is prime: $result');
                },
                child: const Text('button')),
          ],
        ),
      ),
    );
  }
}
