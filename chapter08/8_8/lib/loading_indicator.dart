import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      /* ◆ CircularProgressIndicator      回転アニメーションする円形のインジケータWidget */
      child: CircularProgressIndicator(),
    );
  }
}
