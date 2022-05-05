import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class likeAnimation extends StatefulWidget {
  const likeAnimation({Key? key}) : super(key: key);

  @override
  State<likeAnimation> createState() => _likeAnimationState();
}

class _likeAnimationState extends State<likeAnimation> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  bool animate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          if(animate == false){
            animate = true;
            _controller.forward();
          }else{
            animate = false;
            _controller.reverse();
          }
        },
        child: Lottie.network(
            "https://assets1.lottiefiles.com/packages/lf20_Zels7w.json",
            controller: _controller,
          width: 40,
        ),
      ),
    );
  }
}
