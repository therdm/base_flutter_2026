import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LazyLottie extends StatelessWidget {
  const LazyLottie({super.key, required this.asset, this.package, this.height, this.width});

  final String asset;
  final String? package;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(asset, package: package, height: height, width: width);
  }
}
