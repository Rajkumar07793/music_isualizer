import 'dart:math' as math;
import 'package:flutter/material.dart';

class LoadingBouncingLine extends StatefulWidget {
  final int noOfDots;
  final AnimationController controller;
  final List<Color> backgroundColor;
  final Color borderColor;
  final double size;
  final double borderSize;
  final Duration duration;
  final IndexedWidgetBuilder itemBuilder;

  LoadingBouncingLine({
    Key key,
    this.noOfDots,
    this.controller,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
    this.size = 50.0,
    this.borderSize,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1000),
  }):super(key: key);

  @override
  _LoadingBouncingLineState createState() => _LoadingBouncingLineState();
}

class _LoadingBouncingLineState extends State<LoadingBouncingLine>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation<Color> _animation1;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween(begin: -math.pi, end: math.pi).animate(_controller)
      ..addListener(() => setState(() {}));
    _animation1 = TweenSequence<Color>([
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.red, end: Colors.blue),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.blue, end: Colors.green),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.green, end: Colors.yellow),
      ),
      TweenSequenceItem(
        weight: 1.0,
        tween: ColorTween(begin: Colors.yellow, end: Colors.red),
      ),
    ]).animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < (widget.noOfDots??3); i++)...[SizedBox(width: 5,) ,_buildShape(_animation, i),SizedBox(width: 5,)]
        ],
      ),
    );
  }

  Widget _buildShape(Animation<double> animation, int index) {
    return Transform.scale(
      scale: math.sin(animation.value + (-0.5 * index)).abs(),
      child: _itemBuilder(index),
    );
  }

  Widget _itemBuilder(int index) {
    return SizedBox.fromSize(
      size: Size.square(widget.size / 4),
      child: widget.itemBuilder != null
          ? widget.itemBuilder(context, index)
          : DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _animation1.value,
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderSize != null
                ? widget.borderSize / 4
                : widget.size / 32,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
