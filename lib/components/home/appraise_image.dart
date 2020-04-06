import 'dart:io';

import 'package:color_picker/components/home/bloc/appraise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppraiseImage extends StatelessWidget {
  final GlobalKey _imageKey = GlobalKey();
  final File _imageFile;
  AppraiseImage({Key key, File imageFile}) : this._imageFile = imageFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanEnd: (DragEndDetails details) {
        BlocProvider.of<AppraiseBloc>(context).add(CancelAppraise());
      },
      onPanDown: (DragDownDetails details) {
        RenderBox imageBox = _imageKey.currentContext.findRenderObject();
        Offset localPosition = imageBox.globalToLocal(details.globalPosition);
        BlocProvider.of<AppraiseBloc>(context)
            .add(UpdateAppraise(localPosition, imageBox.size));
      },
      onPanUpdate: (DragUpdateDetails details) {
        RenderBox imageBox = _imageKey.currentContext.findRenderObject();
        Offset localPosition = imageBox.globalToLocal(details.globalPosition);
        BlocProvider.of<AppraiseBloc>(context)
            .add(UpdateAppraise(localPosition, imageBox.size));
      },
      child: Center(
        child: Image.file(
          _imageFile,
          key: _imageKey,
        ),
      ),
    );
  }
}
