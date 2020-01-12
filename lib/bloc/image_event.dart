import 'package:meta/meta.dart';

@immutable
abstract class ImageEvent {}

class OpenCameraEvent extends ImageEvent {}

class OpenGalleryEvent extends ImageEvent {}
