import 'dart:io';

import 'package:color_picker/components/home/bloc/appraise_bloc.dart';
import 'package:color_picker/models/coordinate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppraiseImage extends StatelessWidget {
  final File _imageFile;
  const AppraiseImage({Key key, File imageFile}) : this._imageFile = imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (DragEndDetails details) {
        BlocProvider.of<AppraiseBloc>(context).add(CancelAppraise());
      },
      onPanDown: (DragDownDetails details) {
        Coordinate point = Coordinate(
            x: details.globalPosition.dx.toInt(),
            y: details.globalPosition.dy.toInt());
        BlocProvider.of<AppraiseBloc>(context).add(UpdateAppraise(point));
      },
      onPanUpdate: (DragUpdateDetails details) {
        Coordinate point = Coordinate(
            x: details.globalPosition.dx.toInt(),
            y: details.globalPosition.dy.toInt());
        BlocProvider.of<AppraiseBloc>(context).add(UpdateAppraise(point));
      },
      child: Image.file(_imageFile),
    );
  }
}
