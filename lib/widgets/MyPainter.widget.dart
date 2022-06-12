import 'dart:math';

import 'package:flutter/material.dart';
  late double value;
class MyPainter extends CustomPainter {
  final BuildContext context;
  final double radius;
  final double radians;
  MyPainter(this.context, this.radius, this.radians);
  @override
  void paint(Canvas canvas, Size size) {
    value=radians<0?-radians:radians;
    double xc = size.width/2;
    double yc = size.height/2;
    Offset cl = Offset(xc, yc);
    Offset cl2 = Offset(xc, yc+radius*2);
    Offset cl3 = Offset(xc+radius*value, yc+radius*2);
    Paint paint1 = Paint()
    ..color=Theme.of(context).canvasColor
    ..strokeWidth=5
    ..style=PaintingStyle.stroke;

    Paint paint2 = Paint()
      ..color=Theme.of(context).canvasColor
      ..strokeWidth=3
      ..style=PaintingStyle.stroke;
    double xp=xc+radius*cos(radians);
    double yp=yc+radius*sin(radians);
    Offset p = Offset(xp, yp);

    canvas.drawCircle(cl, radius*2, paint1);
    canvas.drawLine(cl2,cl3,paint1);
    canvas.drawCircle(cl, 4, paint2);

    double xc2=xc-radius*sin(radians);
    double yc2=yc+radius*cos(radians);
    double xc3=xc+radius*cos(radians);
    double yc3=yc+radius*sin(radians);
    double xc4=xc+radius*sin(radians);
    double yc4=yc-radius*cos(radians);
    double xc5=xc-radius*cos(radians);
    double yc5=yc-radius*sin(radians);
    Offset c2 = Offset(xc2, yc2);
    Offset c3 = Offset(xc3, yc3);
    Offset c4 = Offset(xc4, yc4);
    Offset c5 = Offset(xc5, yc5);
    canvas.drawCircle(c2, radius/2, paint2);
    canvas.drawCircle(c3, radius/2, paint2);
    canvas.drawCircle(c4, radius/2, paint2);
    canvas.drawCircle(c5, radius/2, paint2);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}