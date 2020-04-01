import 'package:color_picker/components/appraise/appraise_image.dart';
import 'package:color_picker/components/appraise/bloc/appraise_bloc.dart';
import 'package:color_picker/components/appraise/value_configuration.dart';
import 'package:color_picker/components/commons/apparaise_screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppraiseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppraiseScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    final double _usableScreenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final double _usableScreenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppraiseBloc()..add(LoadImageBytes(args.imageFile)),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<AppraiseBloc, AppraiseState>(
            builder: (context, state) {
              var pointer;
              if (state is AppraiseInitial) {
                pointer = Container();
              }
              if (state is AppraiseUpdate) {
                double x = state.point.x.toDouble();
                double y = state.point.y.toDouble();
                var xOffset = x < _usableScreenWidth - 64 ? x + 32 : x - 48;
                var yOffset = y > 64 ? y - 96 : y;
                pointer = Positioned(
                  left: xOffset,
                  top: yOffset,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(width: 2.0, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2))
                      ],
                    ),
                  ),
                );
              }
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          color: Colors.amber,
                          child: AppraiseImage(
                            imageFile: args.imageFile,
                          ),
                        ),
                        pointer,
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: _usableScreenHeight * .3,
                    child: ValueConfiguration(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
