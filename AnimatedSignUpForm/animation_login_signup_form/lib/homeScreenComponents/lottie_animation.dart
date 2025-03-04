import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  final String assetPath;
  final double height;

  const LottieAnimation({
    Key? key,
    required this.assetPath,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Lottie.asset(
        assetPath,
        fit: BoxFit.contain,
      ),
    );
  }
}
