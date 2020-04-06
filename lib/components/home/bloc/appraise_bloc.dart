import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:color_picker/models/color_value.dart';
import 'package:color_picker/utils/color_util.dart';
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
      yield* _mapUpdateAppraise(event.offset, event.containerSize);
    } else if (event is LoadAppraise) {
      yield* _mapLoadAppraise(event.imageFile);
    }
  }

  Stream<AppraiseState> _mapUpdateAppraise(
      ui.Offset offset, ui.Size containerSize) async* {
    if (_selectedImage == null) return;
    int pixelInfo = _computePixelScaledImage(offset, containerSize.width);

    int hex = ColorUtil.kslToARGB(pixelInfo);
    ui.Color currentCOlor = ui.Color(hex);

    RGB rgb = RGB(
        blue: currentCOlor.blue,
        green: currentCOlor.green,
        red: currentCOlor.red);

    CMYK cmyk = ColorUtil.rgbToCmyk(rgb);

    String hexCode = currentCOlor.toString().substring(
        currentCOlor.toString().indexOf("x") + 3,
        currentCOlor.toString().length - 1);

    ColorValue colorValue = ColorValue(rGB: rgb, hEX: hexCode, cMYK: cmyk);
    yield (AppraiseUpdating(colorValue));
  }

  Stream<AppraiseState> _mapLoadAppraise(File imageFile) async* {
    Uint8List imageByte = await imageFile.readAsBytes();
    _selectedImage = decodeImage(imageByte);
  }

  int _computePixelScaledImage(ui.Offset offset, double containerWidth) {
    int scaledX = offset.dx ~/ (containerWidth / _selectedImage.width);
    int scaledY = offset.dy ~/ (containerWidth / _selectedImage.width);
    return _selectedImage.getPixelSafe(scaledX, scaledY);
  }
}
