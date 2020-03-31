import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ValueConfiguration extends StatefulWidget {
  @override
  _ValueConfigurationState createState() => _ValueConfigurationState();
}

class _ValueConfigurationState extends State<ValueConfiguration> {
  final TextEditingController _rgbController = TextEditingController();
  final TextEditingController _hsvController = TextEditingController();
  final TextEditingController _cmykController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();
  final double _wrapSpacing = 8.0;

  @override
  void initState() {
    _rgbController.text = "Hello";
    _hsvController.text = "Hello";
    _cmykController.text = "Hello";
    _hexController.text = "Hello";
    super.initState();
  }

  @override
  void dispose() {
    _rgbController.dispose();
    _hsvController.dispose();
    _cmykController.dispose();
    _hexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: _wrapSpacing,
      runSpacing: _wrapSpacing,
      children: <Widget>[
        ValueField(
          controller: _rgbController,
          labelText: Strings.rgbColorLabel,
        ),
        ValueField(
          controller: _hexController,
          labelText: Strings.hexColorLabel,
        ),
        ValueField(
          controller: _cmykController,
          labelText: Strings.cmykColorLabel,
        ),
        ValueField(
          controller: _hsvController,
          labelText: Strings.hsvColorLabel,
        ),
      ],
    );
  }
}

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
        style: TextStyle(fontSize: 14.0),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: _labelText,
        ),
      ),
    );
  }
}
