import 'package:flutter/material.dart';

import 'package:organicrss/rss/rssLogic.dart';
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
        body: FutureBuilder(future: parseRSS(feedUri: feedUri).getFeed(), builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressIndicator();
          } else {
            final List items = snapshot.data;
            return ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int i) {
              final rssItem item = items[i];
              return ListTile(
                title: Text(item.title), 
                subtitle: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(item.description), 
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0), color: Theme.of(context).highlightColor), 
                    child: Row(children: [const Icon(Icons.timer), Padding(padding: EdgeInsetsDirectional.only(start: 6.0), child: Text(item.relativeTime))]
                  ))
                  ],), 
                onTap: () => launchUrlString(item.uri),
              );
            });
          }
        })
      );
  }
}