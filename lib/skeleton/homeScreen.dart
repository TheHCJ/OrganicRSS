import 'package:flutter/material.dart';

import 'package:organicrss/rss/parseRSS.dart';
import 'package:organicrss/rss/rssClasses.dart';

import 'package:url_launcher/url_launcher_string.dart';

class homeScreen extends StatefulWidget {
  State<homeScreen> createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen> {
  final feedUri = "https://feeds.bbci.co.uk/news/rss.xml";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home"),),
        body: FutureBuilder(future: parseRSS(feedUri: feedUri).parse(), builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else {
            final items = snapshot.data;
            if (items != null)
            {
            return ListView.builder(itemBuilder: (BuildContext context, int i) {
              final rssItem item = items[i];
              return ListTile(title: Text(item.title), subtitle: Text(item.description), onTap: () => launchUrlString(item.uri),);
            });
          } else {
            return const LinearProgressIndicator();
          }
          }
        })
      );
  }
}