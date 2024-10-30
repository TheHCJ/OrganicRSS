import 'package:flutter/material.dart';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:organicrss/NavigationScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(key: super.key, builder: (ColorScheme? lightScheme, ColorScheme? darkScheme) => MaterialApp(
      title: 'OrganicRSS',
      theme: ThemeData(
        colorScheme: lightScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkScheme,
        useMaterial3: true,
      ),
      home: navigationScreen(),
    ));
  }
}