import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movity_app/widgets/notFound.widget.dart';

class Graphics404 extends StatefulWidget {
  const Graphics404({Key? key}) : super(key: key);

  @override
  State<Graphics404> createState() => _Graphics404State();
}

class _Graphics404State extends State<Graphics404> with TickerProviderStateMixin {
  double radius=40;
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    Tween<double> tween = Tween(begin: 20,end: 30);
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
                  painter: notFoundAnimation(animation.value,radius,context),
                );
              },
            );
  }
}
