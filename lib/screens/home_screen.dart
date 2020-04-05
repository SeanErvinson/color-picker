import 'package:color_picker/components/commons/action_button.dart';
import 'package:color_picker/components/home/appraise_image.dart';
import 'package:color_picker/components/home/bloc/asset_bloc.dart';
import 'package:color_picker/components/home/color_preview.dart';
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
      child: Scaffold(
        body: BlocBuilder<AssetBloc, AssetState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: BlocBuilder<AssetBloc, AssetState>(
                    builder: (context, state) {
                      var appraiseImage;
                      if (state is AssetChosen) {
                        appraiseImage = AppraiseImage(
                          imageFile: state.imageFile,
                        );
                      } else {
                        appraiseImage = Container();
                      }
                      return Container(
                        width: double.infinity,
                        color: Colors.amber,
                        child: appraiseImage,
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: _usableScreenHeight * .3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        child: ValueConfiguration(),
                      ),
                      ColorPreview(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          ActionButton(
                            title: Strings.gallery,
                            onPressed: () => BlocProvider.of<AssetBloc>(context)
                                .add(OpenImagePicker()),
                          ),
                          ActionButton(
                            title: Strings.camera,
                            onPressed: () => BlocProvider.of<AssetBloc>(context)
                                .add(OpenCamera()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
