import 'dart:io';

import 'package:color_picker/components/home/bloc/appraise_bloc.dart';
import 'package:color_picker/models/point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppraiseImage extends StatefulWidget {
  final File _imageFile;

  const AppraiseImage({Key key, File imageFile})
      : this._imageFile = imageFile,
        super(key: key);
  @override
  _AppraiseImageState createState() => _AppraiseImageState(_imageFile);
}

class _AppraiseImageState extends State<AppraiseImage> {
  final File imageFile;
  _AppraiseImageState(this.imageFile);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (DragEndDetails details) {
        BlocProvider.of<AppraiseBloc>(context).add(CancelAppraise());
      },
      onPanDown: (DragDownDetails details) {
        Point point = Point(
            x: details.globalPosition.dx.toInt(),
            y: details.globalPosition.dy.toInt());
        BlocProvider.of<AppraiseBloc>(context).add(UpdateAppraise());
      },
      onPanUpdate: (DragUpdateDetails details) {
        Point point = Point(
            x: details.globalPosition.dx.toInt(),
            y: details.globalPosition.dy.toInt());
        BlocProvider.of<AppraiseBloc>(context).add(UpdateAppraise());
      },
      child: Image.file(imageFile),
    );
  }
}
