import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  State<homeScreen> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home"),),
      );
  }
}