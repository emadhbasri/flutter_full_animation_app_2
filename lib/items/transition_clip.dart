import 'package:flutter/material.dart';

class TransitionClip extends CustomClipper<Path> {
  TransitionClip({required this.radius, required this.heightSize});

  final double heightSize;
  final double radius;

  @override
  Path getClip(Size size) {
    double height = size.height * heightSize;
    Path path = Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, height - radius)
      ..arcToPoint(Offset(size.width - radius + 10, height),
          radius: Radius.elliptical(radius, radius + 50))
      ..lineTo(radius - 5, height)
      ..arcToPoint(Offset(0, height - radius),
          radius: Radius.elliptical(radius, radius + 50))
      ..lineTo(0, radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
