import 'package:flutter/material.dart';

class ColorPreview extends StatelessWidget {
  const ColorPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.lightGreenAccent),
      width: 240,
      height: 24,
    );
  }
}
