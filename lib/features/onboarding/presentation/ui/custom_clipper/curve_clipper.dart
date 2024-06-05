import 'package:flutter/material.dart';

class CurveImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 50.0;
    Path path = Path();
    path.lineTo(0, height - offset);
    path.quadraticBezierTo(width / 2, height, width, height - offset);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
