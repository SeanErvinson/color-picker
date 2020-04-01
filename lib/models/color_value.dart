class ColorValue {
  RGB rGB;
  CMYK cMYK;
  String hEX;

  ColorValue({this.rGB, this.cMYK, this.hEX});
}

class RGB {
  int red;
  int green;
  int blue;

  RGB({this.red, this.green, this.blue});
}

class CMYK {
  int cyan;
  int magenta;
  int yellow;
  int black;

  CMYK({this.cyan, this.magenta, this.yellow, this.black});
}
