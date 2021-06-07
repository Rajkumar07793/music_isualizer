import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/bottomnavigation.dart';

class BottomNavigation1 extends StatefulWidget {
  const BottomNavigation1({Key key}) : super(key: key);

  @override
  _BottomNavigation1State createState() => _BottomNavigation1State();
}

class _BottomNavigation1State extends State<BottomNavigation1>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  AnimationController animationController1;
  Animation animation1;

  @override
  void initState() {
    super.initState();
    animate();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: pi).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
    animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 200));
    animation1 = Tween<double>(begin: 0, end: pi).animate(animationController1)
      ..addListener(() {
        setState(() {});
      });
    animationController1.repeat();
  }

  Color color = Colors.green;
  List<Color> colors = [
    Colors.blueAccent,
    Colors.cyan,
    Colors.indigo,
    Colors.cyan,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      extendBody: true,
      backgroundColor: Colors.brown[900],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.cyan[900],
        height: 50,
        animationCurve: Curves.easeIn,
        backgroundColor: Colors.transparent,
        onTap: (i) {
          print(i);
          setState(() {
            color = colors[i];
          });
        },
        items: [
          Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 40,
            color: Colors.white,
          ),
          Icon(
            Icons.call,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 80,
      //   decoration: BoxDecoration(
      //     // shape: BoxShape.circle,
      //     borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
      //     topRight: Radius.circular(20)),
      //     color: Colors.red,
      //   ),
      //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     // backgroundColor: Colors.cyan[900],
      //     children: [
      //     Icon(Icons.home),
      //       Icon(Icons.home),
      //       Icon(Icons.home),
      //     ],
      //   ),
      // ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: 0,
              child: CustomPaint(
                painter: NavCustomPainter(animation),
                child: Container(
                  // color: Colors.red,
                  height: height * 0.5,
                  width: width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.3,
                      ),
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Card(
                        margin: EdgeInsets.only(top: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        color: Colors.pink,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Continue with Free",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -300,
            left: 0,
            right: -400,
            child: RotationTransition(
              turns: animation1,
                child: Image.asset(
              "assets/images/earth.png",
              scale: 1.2,
            )),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    animationController1.dispose();
    super.dispose();
  }
}

class NavCustomPainter extends CustomPainter {
  final Animation animation;

  NavCustomPainter(this.animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.cyan.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..cubicTo(0, 0, size.width * animation.value, size.height, size.width,
          size.height / 4)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    final paint1 = Paint()
      ..color = Colors.red.withOpacity(animation.value / pi)
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
    final paint2 = Paint()
      ..color = Colors.cyanAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    final paint3 = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.fill;
    final paint4 = Paint()
      ..color = Colors.blue.withOpacity(1)
      ..style = PaintingStyle.fill;
    final paint5 = Paint()
      ..color = Colors.green[900].withOpacity(1)
      ..style = PaintingStyle.fill;
    final paint6 = Paint()
      ..color = Colors.blue[900].withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final path2 = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(0, 0, size.width * animation.value, size.height, size.width,
          size.height / 10)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path2, paint2);
    canvas.drawCircle(Offset(50, 400), 20 + 5 * animation.value, paint3);
    canvas.drawCircle(Offset(50, 400), 20, paint4);
    // canvas.drawCircle(
    //     Offset(size.width + 100, 700), 400 + 40 * animation.value, paint6);
    // canvas.drawCircle(Offset(size.width + 100, 700), 400, paint5);

    // canvas.drawCircle(Offset.zero,20, paint);
    // canvas.drawCircle(Offset(50,0),40, paint);

    // canvas.drawCircle(Offset(size.width/2,size.height/2),animation.value*8, paint1);
    // canvas.drawCircle(Offset(size.width/2.4,size.height/2),animation.value, paint1);
    // canvas.drawCircle(Offset(size.width/1.7,size.height/2),animation.value, paint1);
    // canvas.drawCircle(Offset(size.width/1.72,size.height/1.5),animation.value, paint1);
    // canvas.drawLine(Offset(20,20), Offset(20,200), paint1);
    // canvas.drawLine(Offset(40,20), Offset(40,200), paint1);
    // canvas.drawLine(Offset(20,20), Offset(40,20), paint1);
    // canvas.drawLine(Offset(20,200), Offset(40,200), paint1);
    // canvas.drawArc(Rect.fromPoints(Offset(10,100),Offset(200,10)), 3, 2, true, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
