import 'package:flutter/material.dart';

class Rotationimg extends StatelessWidget {
  const Rotationimg({
    Key? key,
    required Animation<double> rotateAnimation,
    required this.urlimg,
    required this.width,
    required this.height,
  })  : _rotateAnimation = rotateAnimation,
        super(key: key);

  final Animation<double> _rotateAnimation;
  final String urlimg;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotateAnimation,
      child: Image(
        image: AssetImage(urlimg),
        width: width,
        height: height,
      ),
    );
  }
}
