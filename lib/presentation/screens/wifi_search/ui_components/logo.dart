import 'package:flutter/material.dart';
import 'package:wifi_list/gen/assets.gen.dart';

class Logo extends StatelessWidget {
  const Logo({required this.width, super.key});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Assets.images.logo.svg(width: width);
  }
}
