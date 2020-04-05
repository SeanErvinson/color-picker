import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  static const double _buttonWidth = 160;
  final String _title;
  final VoidCallback _onPressed;

  const ActionButton({Key key, String title, VoidCallback onPressed})
      : this._title = title,
        this._onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _buttonWidth,
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onPressed: _onPressed,
        child: Text(_title),
      ),
    );
  }
}
