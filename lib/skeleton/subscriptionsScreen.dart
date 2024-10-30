import 'package:flutter/material.dart';
import 'package:organicrss/skeleton/homeScreen.dart';
import 'package:organicrss/utils/caching.dart';

class subscriptionsScreen extends StatefulWidget {
  State<subscriptionsScreen> createState() => subscriptionsScreenState();
}

class subscriptionsScreenState extends State<subscriptionsScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Subscriptions"),),
        body: ListView(children: [
          ListTile(leading: loadImage("https://download.logo.wine/logo/BBC_News/BBC_News-Logo.wine.png"), title: const Text("BBC News"), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => homeScreen())),)
        ],),
      );
  }
}