import 'package:color_picker/components/home/bloc/asset_bloc.dart';
import 'package:color_picker/screens/home_screen.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider(
        create: (context) => AssetBloc()..add(LoadImages()),
        child: HomeScreen(),
      ),
    );
  }
}
