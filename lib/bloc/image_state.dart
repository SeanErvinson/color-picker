import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoaded extends ImageState {
  final File imageFile;

  ImageLoaded(this.imageFile);
}
