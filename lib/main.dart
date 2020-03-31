import 'package:color_picker/screens/home_screen.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColorPickerApp());
}

class ColorPickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      routes: {
        "home": (context) => HomeScreen(),
      },
      home: HomeScreen(),
    );
  }
}
