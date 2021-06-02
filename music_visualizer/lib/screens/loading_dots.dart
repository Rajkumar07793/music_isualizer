import 'package:flutter/material.dart';

class ShowDots extends StatefulWidget {
  final Tween tween;
  final MainAxisAlignment mainAxisAlignment;
  final List<int> duration;
  final int noOfDots;
  final List<Color> colors;

  ShowDots(
      {Key key,
      this.noOfDots,
      this.colors,
      this.duration,
      this.mainAxisAlignment,
      this.tween});

  @override
  _ShowDotsState createState() => _ShowDotsState();
}

class _ShowDotsState extends State<ShowDots> {
  @override
  Widget build(BuildContext context) {
    List<int> duration =
        widget.duration ?? [400, 410, 420, 430, 440, 450, 460, 470, 480, 410];
    int noOfDots = widget.noOfDots ?? 3;
    List<Color> colors = widget.colors ??
        [
          Colors.red,
          Colors.green,
          Colors.yellowAccent,
          Colors.blue,
          Colors.grey,
          Colors.red,
          Colors.green,
          Colors.yellowAccent,
          Colors.blue,
          Colors.grey
        ];
    return Center(
      child: Row(
        mainAxisAlignment:
            widget.mainAxisAlignment ?? MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            noOfDots,
            (index) => LoadingDots(
                  color: colors[index],
                  duration: duration[index],
                )),
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  final Tween tween;
  final duration;
  final color;

  LoadingDots({Key key, this.duration, this.color, this.tween})
      : super(key: key);

  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  animate() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    animation = (widget.tween ?? Tween<double>(begin: 0, end: 20))
        .animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SizedBox(width: animation.value,),
        Container(
          height: animation.value,
          width: animation.value,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        // SizedBox(width: animation.value,)
      ],
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
