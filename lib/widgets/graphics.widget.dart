import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movity_app/widgets/MyPainter.widget.dart';

class Graphics extends StatefulWidget {
  const Graphics({Key? key}) : super(key: key);

  @override
  State<Graphics> createState() => _GraphicsState();
}

class _GraphicsState extends State<Graphics> with TickerProviderStateMixin {
  double radius=20;
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    Tween<double> tween = Tween(begin: -pi,end: pi);
    animation = tween.animate(animationController)
    ..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animationController.repeat();
      }else if(status==AnimationStatus.dismissed){
        animationController.forward();
      }
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
              animation: animation,
              builder: (context,_){
                return CustomPaint(
                  painter: MyPainter(context,radius,animation.value),
                );
              },
            );
  }
}
