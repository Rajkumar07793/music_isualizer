import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/bottomsheet.dart';
import 'package:music_visualizer/screens/bouncing_line.dart';
import 'package:music_visualizer/screens/custom_drawer.dart';
import 'package:music_visualizer/screens/homepage.dart';
import 'package:music_visualizer/screens/layers.dart';
import 'package:music_visualizer/screens/loading_animation.dart';
import 'package:music_visualizer/screens/loading_dots.dart';
import 'package:music_visualizer/screens/popupmenu.dart';
import 'package:music_visualizer/screens/spinner.dart';
import 'package:music_visualizer/screens/spinner1.dart';
import 'package:music_visualizer/screens/spinner2.dart';
import 'package:music_visualizer/screens/spinner3.dart';
import 'package:music_visualizer/screens/table.dart';

import '../main.dart';
import 'bottomnavigation.dart';

class CustomDrawer2 extends StatefulWidget {
  const CustomDrawer2({Key key}) : super(key: key);

  @override
  _CustomDrawer2State createState() => _CustomDrawer2State();
}

class _CustomDrawer2State extends State<CustomDrawer2>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation, animation1;
  bool isOpen = false;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    CurvedAnimation curve = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubic);
    animation = Tween<double>(begin: 0, end: 200).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animation1 = Tween<double>(begin: 0, end: 30).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Colors.red,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue[400],
              Colors.blue[900],
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: ListView(
              children: [
                DrawerHeader(
                  child: CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.asset(
                        "assets/images/Rknew.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    backgroundImage: AssetImage("assets/images/Rknew.jpg"),
                  ),
                ),
                listTile(context, "Music Visualizer", MusicVisualizer()),
                listTile(context, "Loading Animation", Loading()),
                listTile(
                  context,
                  "Loading Dots",
                  ShowDots(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                listTile(context, "Spin", Spin()),
                listTile(context, "Spin1", Spin1()),
                listTile(context, "Spin2", Spin2()),
                listTile(
                  context,
                  "Spin3",
                  WidgetCircularAnimator(
                    size: 200,
                    child: Center(
                      child: CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage("assets/images/Rknew.jpg")),
                      // child: Text(
                      //   "RK",
                      //   style: TextStyle(inherit: false, fontSize: 33),
                      // ),
                    ),
                  ),
                ),
                listTile(
                    context, "Loading bouncing line", LoadingBouncingLine()),
                listTile(context, "Bottom Navigation", BottomNavigation()),
                listTile(context, "Layers", BottomNavigation1()),
                listTile(context, "Pop up Menu", PopUpMenu()),
                listTile(context, "Bottom Sheet", BottomSheets()),
                listTile(context, "Table", TableExample()),
                listTile(context, "Custom Drawer", CustomDrawer()),
              ],
            ),
          ),
          Positioned(
            top: animation.value,
            left: animation.value * 1.5,
            bottom: animation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    isOpen ? animation1.value : animation1.value),
                color: Colors.white,
              ),
              width: width,
              height: height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          isOpen
                              ? animationController.reverse()
                              : animationController.forward();
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: AnimatedIcon(
                            icon: AnimatedIcons.menu_arrow,
                            progress: animationController,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 200 - animation.value,
                      child: Image.asset('assets/images/earth.png')),
                  AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: animationController,
                      color: Colors.black,
                  size: 100,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
