import 'package:color_app/screens/settings.dart';
import 'package:color_app/screens/colorpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // debugShowCheckedModeBanner: false,
      routes: {
        Settings.id: (context) => const Settings(),
        // ignore: prefer_const_constructors
      },
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
    // final double height = MediaQuery.of(context).size.height;
    return TwoColors(width: width);
  }
}
