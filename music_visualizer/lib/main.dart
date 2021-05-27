import 'package:flutter/material.dart';
import 'package:music_visualizer/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(backgroundColor: Colors.black,body: Center(child: Container(child: _MusicVisualizer()))),
    );
  }
}

class _MusicVisualizer extends StatefulWidget {
  @override
  __MusicVisualizerState createState() => __MusicVisualizerState();
}

class __MusicVisualizerState extends State<_MusicVisualizer> {
  List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent
  ];

  List<int> duration = [900, 700, 600, 800, 500];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: new List<Widget>.generate(
            30,
            (index) => VisualComponent(
                duration: duration[index % 5], color: colors[index % 4])));
  }
}
