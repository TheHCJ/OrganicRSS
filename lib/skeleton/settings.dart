import 'package:flutter/material.dart';

import 'package:organicrss/rss/rssLogic.dart';

class settingsScreen extends StatefulWidget {
  State<settingsScreen> createState() => settingsScreenState();
}

class settingsScreenState extends State<settingsScreen> {
  final parser = parseRSS();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings"),),
        body: ListView(children: [
          ListTile(leading: const Icon(Icons.delete), title: const Text("Clear cache"), onTap: () => parser.emptyCache(),)
        ],),
      );
  }
}