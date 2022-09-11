import 'dart:math';

import 'package:flutter/material.dart';

class ClipperPath extends CustomClipper<Path> {
  final double angle;

  ClipperPath(this.angle);

  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset center = size.center(Offset.zero);
    Rect rect = Rect.fromCircle(center: center, radius: size.width / 2);
    path.moveTo(center.dx, center.dy);
    path.arcTo(rect, -pi / 2 - angle / 2, angle, false);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ClipperPath oldClipper) {
    return angle != oldClipper.angle;
  }
}
