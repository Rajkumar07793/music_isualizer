import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  Color color = Colors.green;
  List<Color> colors = [Colors.blueAccent, Colors.cyan, Colors.lightGreenAccent,Colors.grey, Colors.yellowAccent];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        animationCurve: Curves.easeIn,
        backgroundColor: color,
        onTap: (i){
          print(i);
          setState(() {
            color = colors[i];
          });
        },
        items: [
          Icon(Icons.favorite,color: color,),
          Icon(Icons.notifications,color: color,),
          Icon(Icons.home,size: 40,color: color,),
          Icon(Icons.call,color: color,),
          Icon(Icons.shopping_cart,color: color,),
        ],
      ),
    );
  }
}
