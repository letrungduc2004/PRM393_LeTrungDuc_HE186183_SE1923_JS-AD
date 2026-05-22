import 'package:flutter/material.dart';

class MyButtonBar extends StatelessWidget {
  const MyButtonBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.orange, fontWeight: FontWeight.bold,),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.orange, fontWeight: FontWeight.bold),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.orange, fontWeight: FontWeight.bold),
              label: "Profile"),
        ],)
    ;
  }
}
