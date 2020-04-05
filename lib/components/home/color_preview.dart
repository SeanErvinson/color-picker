import 'package:color_picker/components/home/bloc/appraise_bloc.dart';
import 'package:color_picker/models/color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPreview extends StatelessWidget {
  const ColorPreview({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppraiseBloc, AppraiseState>(
      builder: (context, state) {
        Color color;
        if (state is AppraiseUpdating) {
          RGB rgb = state.colorValue.rGB;
          color = Color.fromARGB(255, rgb.red, rgb.green, rgb.blue);
        }
        return Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: color,
          ),
          width: 240,
          height: 24,
        );
      },
    );
  }
}
