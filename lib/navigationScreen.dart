import 'package:flutter/material.dart';

import 'package:organicrss/skeleton/homeScreen.dart';
import 'package:organicrss/skeleton/subscriptionsScreen.dart';
import 'package:organicrss/skeleton/addFeedsScreen.dart';
import 'package:organicrss/skeleton/settings.dart';

class navigationScreen extends StatefulWidget {
  @override
  State<navigationScreen> createState() => navigationScreenState();
}

class navigationScreenState extends State<navigationScreen> {
  List<NavigationDestination> destinations = const [NavigationDestination(icon: Icon(Icons.home), label: "Home"), NavigationDestination(icon: Icon(Icons.subscriptions), label: "Subscriptions"), NavigationDestination(icon: Icon(Icons.feed), label: "Add feeds"), NavigationDestination(icon: Icon(Icons.settings), label: "Settings")];
  List<Widget> destinationsScreens = [homeScreen(), subscriptionsScreen(), addFeedsScreen(), settingsScreen()];

  int pageId = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: destinationsScreens[pageId],
      bottomNavigationBar: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, 
          destinations: destinations,
          onDestinationSelected: (int newPageId) =>setState(() {pageId = newPageId;}), 
        ),
    );
  }
}