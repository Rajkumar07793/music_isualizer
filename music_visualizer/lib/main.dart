import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/homepage.dart';
import 'package:music_visualizer/screens/loading_animation.dart';
import 'package:music_visualizer/screens/loading_dots.dart';
import 'package:music_visualizer/screens/spinner.dart';
import 'package:music_visualizer/screens/spinner1.dart';
import 'package:music_visualizer/screens/spinner2.dart';
import 'package:music_visualizer/screens/spinner3.dart';

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
      ),
      home: Index(),
    );
  }
}

class Index extends StatelessWidget {
  const Index({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          listTile(context, "Music Visualizer", MusicVisualizer()),
          listTile(context, "Loading Animation", Loading()),
          listTile(
              context,
              "Loading Dots",
              ShowDots(
                mainAxisAlignment: MainAxisAlignment.center,
              )),
          listTile(context, "Spin", Spin()),
          listTile(context, "Spin1", Spin1()),
          listTile(context, "Spin2", Spin2()),
          listTile(
              context,
              "Spin3",
              WidgetCircularAnimator(
                child: Center(child: Text("RK",style: TextStyle(inherit: false,fontSize: 33),)),
              )),
        ],
      ),
    );
  }
}

Widget listTile(context, title, screen) {
  return Card(
    elevation: 10,
    // color: Colors.cyanAccent,
    child: ListTile(
      tileColor: Colors.lime,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));
      },
    ),
  );
}
