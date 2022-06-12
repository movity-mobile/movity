import 'dart:math';
import 'package:flutter/material.dart';
class notFoundAnimation extends CustomPainter {
  final double distance;
  final double radius;
  final BuildContext context;
  notFoundAnimation(this.distance, this.radius,this.context);
  @override
  void paint(Canvas canvas, Size size) {
    final double xc=size.width/2;
    final double yc=-2*distance+size.height/2;
    Offset center=Offset(xc, yc);
    final double xc2=xc+radius*2*cos(pi/2)+radius*sin(pi/6)+radius;
    final double yc2=yc+radius*2*sin(3*pi)+radius*1.4;
    final double xc4 = xc+3*radius;
    final double yc4 = yc-3*radius;
    final double xc6 = xc+2*radius;
    final double yc6 = yc-2*radius;
    final double xc7 = xc+2*radius;
    final double yc7 = yc-3*radius;
    final double xc8 = xc+3*radius;
    final double yc8 = yc-2*radius;
    final double xc9 = xc-2.5*radius;
    final double yc9 = yc-radius;
    final double xc10 = xc-3.5*radius;
    final double yc10 = yc;
    final double xc11 = xc-3.5*radius;
    final double yc11 = yc-radius;
    final double xc12 = xc-2.5*radius;
    final double yc12 = yc;
    final double xc5 = xc-(0.7*radius-distance);
    final double yc5 = yc+1.3*radius;
    double xc1=xc+distance;
    double yc1=yc-0.5*radius;
    double xc3=xc-(1.5*radius-distance);
    double yc3=yc-0.5*radius;
    Offset centre2=Offset(xc2,yc2);
    Offset centre1=Offset(xc1,yc1);
    Offset centre3=Offset(xc3,yc3);
    Offset centre4=Offset(xc4,yc4);
    Offset centre6=Offset(xc6,yc6);
    Offset centre5=Offset(xc5,yc5);
    Offset centre7=Offset(xc7,yc7);
    Offset centre8=Offset(xc8,yc8);
    Offset centre9=Offset(xc9,yc9);
    Offset centre10=Offset(xc10,yc10);
    Offset centre11=Offset(xc11,yc11);
    Offset centre12=Offset(xc12,yc12);
    Paint paint1=Paint()
      ..color=Theme.of(context).canvasColor
      ..strokeWidth=5
      ..style=PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Paint paint2=Paint()
      ..color=Theme.of(context).canvasColor
      ..strokeWidth=5
      ..style=PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    Paint paint3=Paint()
      ..color=Theme.of(context).canvasColor
      ..strokeWidth=8
      ..style=PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius*2, paint3);
    canvas.drawCircle(centre1, radius/3, paint1);
    canvas.drawCircle(centre3, radius/3, paint2);
    canvas.drawLine(centre4, centre6, paint3);
    canvas.drawLine(centre7, centre8, paint3);
    canvas.drawLine(centre9, centre10, paint3);
    canvas.drawLine(centre11, centre12, paint3);
    final redCircle = Paint()
      ..color = Theme.of(context).canvasColor
      ..strokeWidth=8
      ..style = PaintingStyle.stroke;
    final arcRect = Rect.fromCircle(
        center: centre5, radius: radius);
    canvas.drawArc(arcRect, -5*pi/6, 2*pi/3, false, redCircle);
    final double xp= radius*cos(pi/2)+radius*sin(pi/6)+xc2*1.7;
    final double yp=radius*sin(3*pi)-2*radius+radius*11-2*distance;
    canvas.drawLine(centre2, Offset(xp,yp), paint3);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}