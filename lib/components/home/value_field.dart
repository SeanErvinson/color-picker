import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ValueField extends StatelessWidget {
  const ValueField({
    Key key,
    @required TextEditingController controller,
    @required String labelText,
  })  : _controller = controller,
        _labelText = labelText,
        super(key: key);

  final TextEditingController _controller;
  final String _labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: TextField(
        onTap: () {
          Clipboard.setData(ClipboardData(text: _controller.text));
          Fluttertoast.showToast(
            msg: Strings.copyClipboard,
            fontSize: 12.0,
          );
        },
        textAlign: TextAlign.center,
        readOnly: true,
        controller: _controller,
        style: TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(8.0),
          border: OutlineInputBorder(),
          labelText: _labelText,
          labelStyle: TextStyle(fontSize: 14.0),
        ),
      ),
    );
  }
}
