import 'dart:math' as mt;

import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  double angle;
  TriangleClipper(this.angle);
  @override
  Path getClip(Size size) {
    var path = Path();
    //  Offset center = size.center(Offset(size.width, size.height));
    //  Rect rect =
    // Rect.fromCenter(center: center, width: size.width, height: size.height);
    //path.arcTo(rect, -mt.pi / 2 - angle / 2, angle, false);
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 1);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
