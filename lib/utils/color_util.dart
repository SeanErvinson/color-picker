import 'dart:math';

import 'package:color_picker/models/color_value.dart';

class ColorUtil {
  static int kslToARGB(int ksl) {
    int red = (ksl >> 16) & 0xFF;
    int blue = ksl & 0xFF;
    return (ksl & 0xFF00FF00) | (blue << 16) | red;
  }

  static CMYK rgbToCmyk(RGB rgb) {
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
