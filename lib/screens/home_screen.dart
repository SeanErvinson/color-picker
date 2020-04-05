import 'package:color_picker/components/commons/action_button.dart';
import 'package:color_picker/components/commons/apparaise_screen_arguments.dart';
import 'package:color_picker/components/home/bloc/asset_bloc.dart';
import 'package:color_picker/components/home/value_configuration.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usableScreenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: BlocListener<AssetBloc, AssetState>(
        listener: (context, state) {
          if (state is AssetChosen) {
            Navigator.of(context).pushNamed("appraise",
                arguments: AppraiseScreenArguments(state.imageFile));
          }
        },
        child: BlocBuilder<AssetBloc, AssetState>(
          builder: (context, state) {
            return Scaffold(
                body: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: _usableScreenHeight * .3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        color: Colors.black,
                      ),
                      Expanded(
                        child: ValueConfiguration(),
                      ),
                      Row(
                        children: <Widget>[
                          ActionButton(
                            title: Strings.gallery,
                            onPressed: () =>
                                BlocProvider.of<AssetBloc>(context).add(
                              OpenImagePicker(),
                            ),
                          ),
                          ActionButton(
                            title: Strings.camera,
                            onPressed: () =>
                                BlocProvider.of<AssetBloc>(context).add(
                              OpenCamera(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}
