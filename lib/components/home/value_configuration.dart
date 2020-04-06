import 'package:color_picker/components/home/value_field.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/appraise_bloc.dart';

class ValueConfiguration extends StatefulWidget {
  @override
  _ValueConfigurationState createState() => _ValueConfigurationState();
}

class _ValueConfigurationState extends State<ValueConfiguration> {
  final TextEditingController _rgbController = TextEditingController();
  final TextEditingController _cmykController = TextEditingController();
  final TextEditingController _hexController = TextEditingController();
  final double _wrapSpacing = 8.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _rgbController.dispose();
    _cmykController.dispose();
    _hexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppraiseBloc, AppraiseState>(
      builder: (context, state) {
        if (state is AppraiseUpdating) {
          _hexController.text = state.colorValue.hEX;
          _rgbController.text = state.colorValue.rGB.toString();
          _cmykController.text = state.colorValue.cMYK.toString();
        }
        return Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
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
          ],
        );
      },
    );
  }
}
