import 'package:color_picker/components/appraise/value_configuration.dart';
import 'package:color_picker/components/commons/apparaise_screen_arguments.dart';
import 'package:flutter/material.dart';

class AppraiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppraiseScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final double _usableScreenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.amber,
                child: Image.file(args.imageFile),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: _usableScreenHeight * .3,
              child: ValueConfiguration(),
            ),
          ],
        ),
      ),
    );
  }
}
