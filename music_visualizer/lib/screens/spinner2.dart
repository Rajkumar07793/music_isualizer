import 'package:flutter/material.dart';

class Spin2 extends StatefulWidget {
  const Spin2({Key key}) : super(key: key);

  @override
  _Spin2State createState() => _Spin2State();
}

class _Spin2State extends State<Spin2> with SingleTickerProviderStateMixin{
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
        alignment: Alignment(1-animation.value/300,1-animation.value/300),
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
