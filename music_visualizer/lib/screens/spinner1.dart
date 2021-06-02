import 'package:flutter/material.dart';

class Spin1 extends StatefulWidget {
  const Spin1({Key key}) : super(key: key);

  @override
  _Spin1State createState() => _Spin1State();
}

class _Spin1State extends State<Spin1> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 5));
    CurvedAnimation curve = CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animation = Tween<double>(begin: 0, end: 300).animate(curve)..addListener(() {
      setState(() {

      });
    });
    animationController.repeat(reverse: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Align(
        alignment: Alignment(animation.value/300,animation.value/300),
        child: Container(
          // height: animation.value,
          // width: animation.value,
          // color: Colors.cyan,
          child: Icon(Icons.android_outlined,size: animation.value,color: Colors.white,),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
