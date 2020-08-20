import 'package:flutter/material.dart';

class DiscountPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 5.5,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    final paint = Paint();
    paint.color = Color(0xfffcd511);
    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
