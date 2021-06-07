import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/bottomsheet.dart';
import 'package:music_visualizer/screens/bouncing_line.dart';
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

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
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
        setState(() {
          print(animation.value);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.red,
              child: ListView(
                children: [
                  listTile(context, "Music Visualizer", MusicVisualizer()),
                  listTile(context, "Loading Animation", Loading()),
                  listTile(
                    context,
                    "Loading Dots",
                    ShowDots(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),),
                  listTile(context, "Spin", Spin()),
                  listTile(context, "Spin1", Spin1()),
                  listTile(context, "Spin2", Spin2()),
                  listTile(
                    context,
                    "Spin3",
                    WidgetCircularAnimator(size: 200,
                      child: Center(
                        child:
                        CircleAvatar(radius: 100,backgroundImage: AssetImage("assets/images/Rknew.jpg")),
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
              left: animation.value*1.5,
              bottom: animation.value,
              child: Container(
                width: width,
                height: height,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isOpen =! isOpen;
                        });
                        isOpen?animationController.reverse():animationController.forward();
                      },
                      child: AnimatedIcon(
                          icon: AnimatedIcons.menu_arrow,
                          progress: animationController,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
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
