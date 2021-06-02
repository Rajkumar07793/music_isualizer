import 'package:flutter/material.dart';

class Spin extends StatefulWidget {
  const Spin({Key key}) : super(key: key);

  @override
  _SpinState createState() => _SpinState();
}

class _SpinState extends State<Spin> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)..addListener(() {
      setState(() {

      });
    });
    animationController.repeat(reverse: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        // color: Colors.cyan,
        child: Icon(Icons.android_outlined,size: animation.value,color: Colors.white,),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
