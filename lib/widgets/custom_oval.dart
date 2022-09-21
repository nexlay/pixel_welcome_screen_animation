import 'package:flutter/material.dart';
import 'dart:math' as math;

class COval extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
   const angle = math.pi / 4;
   Offset center = Offset(size.height * 2, size.width);
   Paint paint = Paint()
   ..style = PaintingStyle.stroke
   ..strokeWidth = 1.5;
   canvas.rotate(angle);
   Rect myRect = Rect.fromCenter(center: center, width: size.width * 7, height: size.height * 5);
   canvas.drawOval(myRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

