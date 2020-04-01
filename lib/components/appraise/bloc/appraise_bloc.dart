import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart';

import 'package:bloc/bloc.dart';
import 'package:color_picker/models/color_value.dart';
import 'package:color_picker/models/point.dart' as pt;
import 'package:meta/meta.dart';

part 'appraise_event.dart';
part 'appraise_state.dart';

class AppraiseBloc extends Bloc<AppraiseEvent, AppraiseState> {
  Image _image;
  @override
  AppraiseState get initialState => AppraiseInitial();

  @override
  Stream<AppraiseState> mapEventToState(
    AppraiseEvent event,
  ) async* {
    if (event is LoadImageBytes) {
      Uint8List imageBytes = await event.imageFile.readAsBytes();
      _image = decodeImage(imageBytes);
    } else if (event is UpdateAppraise) {
      yield* _mapUpdateAppraise(event.point);
    } else if (event is CancelAppraise) {
      yield* _mapCancelAppraise();
    }
  }

  Stream<AppraiseState> _mapUpdateAppraise(pt.Point point) async* {
    // var pixel = _image.getPixelSafe(x.toInt(), y.toInt());
    // int r = (pixel >> 16) & 0xFF;
    // int b = pixel & 0xFF;
    // int value = (pixel & 0xFF00FF00) | (b << 16) | r;
    // print("x ${x.toInt()} y ${y.toInt()} value $pixel");
    yield AppraiseUpdate(colorValue: ColorValue(), point: point);
  }

  Stream<AppraiseState> _mapCancelAppraise() async* {
    yield AppraiseInitial();
  }
}
