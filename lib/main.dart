import 'package:color_app/screens/settings.dart';
import 'package:color_app/screens/colorpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Settings.id: (context) => const Settings(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xff7165e3)),
      darkTheme: ThemeData.dark(),
      home: const MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatelessWidget {
  const MyAppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return TwoColors(width: width);
  }
}
