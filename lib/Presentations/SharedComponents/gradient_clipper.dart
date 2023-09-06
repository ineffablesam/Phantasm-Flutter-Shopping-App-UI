import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class GradientClipper extends StatelessWidget {
  final double height;

  const GradientClipper({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(height, height),
      painter: RPSCustomGradientPainter(),
    );
  }
}

class RPSCustomGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0002052135, size.height * 0.9951146);
    path_0.cubicTo(
        size.width * 0.0001986577,
        size.height * 0.9934204,
        size.width * 0.0001980516,
        size.height * 0.9917070,
        size.width * 0.0002037642,
        size.height * 0.9899682);
    path_0.cubicTo(
        size.width * 0.00007842419,
        size.height * 0.7644713,
        size.width * -0.008139535,
        size.height * 0.2307503,
        size.width * -0.008139535,
        size.height * 0.1273885);
    path_0.cubicTo(
        size.width * -0.008139535,
        size.height * 0.02323268,
        size.width * -0.0009575767,
        size.height * -0.06410318,
        size.width * 0.01744186,
        size.height * -0.01273885);
    path_0.cubicTo(
        size.width * 0.2838558,
        size.height * -0.01273885,
        size.width * 0.8890860,
        size.height * -0.04458599,
        size.width * 0.9511628,
        size.height * -0.04458599);
    path_0.cubicTo(
        size.width * 1.064758,
        size.height * -0.04458599,
        size.width * 1.004651,
        size.height * 0.1592357,
        size.width * 1.004651,
        size.height * 0.3694268);
    path_0.cubicTo(
        size.width * 1.004651,
        size.height * 0.5796178,
        size.width * 0.9255814,
        size.height * 0.7292994,
        size.width * 0.8406977,
        size.height * 0.7292994);
    path_0.lineTo(size.width * 0.1224188, size.height * 0.7292994);
    path_0.cubicTo(
        size.width * 0.02028147,
        size.height * 0.7292994,
        size.width * 0.0005206581,
        size.height * 0.8935924,
        size.width * 0.0002037642,
        size.height * 0.9899682);
    path_0.cubicTo(
        size.width * 0.0002047272,
        size.height * 0.9917006,
        size.width * 0.0002052135,
        size.height * 0.9934204,
        size.width * 0.0002052135,
        size.height * 0.9951146);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(Offset(-20, 0), Offset(-30, 90), [
      Color(0xff1446a6),
      Color(0xff0d2e6c),
      Color(0xff0F3576),
    ], [
      0.1,
      0.9,
      1
    ]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
