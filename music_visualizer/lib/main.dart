import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/bottomnavigation.dart';
import 'package:music_visualizer/screens/bottomsheet.dart';
import 'package:music_visualizer/screens/bouncing_line.dart';
import 'package:music_visualizer/screens/custom_drawer.dart';
import 'package:music_visualizer/screens/custom_drawer2.dart';
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Animations Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.cyanAccent
      ),
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                  Colors.blue[900],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 5),
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
            listTile(context, "Custom Drawer 2", CustomDrawer2()),
          ],
        ),
      ),
    );
  }
}

Widget listTile(context, title, screen) {
  return ListTile(
    // tileColor: Colors.cyan[900],
    leading: FlutterLogo(),
    title: Text(
      title,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
    ),
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screen));
    },
  );
}
