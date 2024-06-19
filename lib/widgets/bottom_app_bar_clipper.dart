import 'package:flutter/cupertino.dart';

class BottomAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    final notchRadius = 32.0;
    final notchCenter = size.width / 2;
    path.arcToPoint(
      Offset(notchCenter - notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(notchCenter + notchRadius, 0),
      radius: Radius.circular(notchRadius),
      clockwise: false,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  
}