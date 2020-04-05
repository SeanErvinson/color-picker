import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:math';
import 'package:color_picker/models/color_value.dart';
import 'package:color_picker/models/coordinate.dart';
import 'package:image/image.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appraise_event.dart';
part 'appraise_state.dart';

class AppraiseBloc extends Bloc<AppraiseEvent, AppraiseState> {
  Image _selectedImage;
  @override
  AppraiseState get initialState => AppraiseInitial();

  @override
  Stream<AppraiseState> mapEventToState(
    AppraiseEvent event,
  ) async* {
    if (event is UpdateAppraise) {
      yield* _mapUpdateAppraise(event.coordinate);
    } else if (event is LoadAppraise) {
      yield* _mapLoadAppraise(event.imageFile);
    }
  }

  Stream<AppraiseState> _mapUpdateAppraise(Coordinate coordinate) async* {
    if (_selectedImage == null) return;
    int hex =
        kslToARGB(_selectedImage.getPixelSafe(coordinate.x, coordinate.y));
    ui.Color currentCOlor = ui.Color(hex);
    RGB rgb = RGB(
        blue: currentCOlor.blue,
        green: currentCOlor.green,
        red: currentCOlor.red);
    CMYK cmyk = rgbToCmyk(rgb);
    ColorValue colorValue = ColorValue(
        rGB: rgb,
        hEX: currentCOlor.toString().substring(
            currentCOlor.toString().indexOf("x") + 3,
            currentCOlor.toString().length - 1),
        cMYK: cmyk);
    yield (AppraiseUpdating(colorValue));
  }

  Stream<AppraiseState> _mapLoadAppraise(File imageFile) async* {
    Uint8List imageByte = await imageFile.readAsBytes();
    _selectedImage = decodeImage(imageByte);
  }

  int kslToARGB(int ksl) {
    int red = (ksl >> 16) & 0xFF;
    int blue = ksl & 0xFF;
    return (ksl & 0xFF00FF00) | (blue << 16) | red;
  }

  CMYK rgbToCmyk(RGB rgb) {
    CMYK cmyk = CMYK();
    double red = 1 - (rgb.red / 255);
    double green = 1 - (rgb.green / 255);
    double blue = 1 - (rgb.blue / 255);

    double maxValue = min(red, min(green, blue));
    double divisor = (1 - maxValue);

    cmyk.black = (maxValue * 100).round();
    cmyk.cyan = cmyk.magenta = cmyk.yellow = 0;
    if (divisor != 0) {
      cmyk.cyan = (((red - maxValue) / divisor) * 100).round();
      cmyk.magenta = (((green - maxValue) / divisor) * 100).round();
      cmyk.yellow = (((blue - maxValue) / divisor) * 100).round();
    }
    return cmyk;
  }
}
