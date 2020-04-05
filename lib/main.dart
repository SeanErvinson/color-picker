import 'package:color_picker/components/home/bloc/appraise_bloc.dart';
import 'package:color_picker/components/home/bloc/asset_bloc.dart';
import 'package:color_picker/screens/screens.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(ColorPickerApp());
}

class ColorPickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      routes: {
        "home": (context) => HomeScreen(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AssetBloc>(
            create: (context) => AssetBloc(),
          ),
          BlocProvider<AppraiseBloc>(
            create: (context) => AppraiseBloc(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
