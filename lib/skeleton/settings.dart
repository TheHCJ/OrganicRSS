import 'package:flutter/material.dart';

class settingsScreen extends StatefulWidget {
  State<settingsScreen> createState() => settingsScreenState();
}

class settingsScreenState extends State<settingsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Settings"),),
      );
  }
}