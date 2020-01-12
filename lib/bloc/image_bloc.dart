import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import './bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  @override
  ImageState get initialState => ImageInitial();

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    if (event is OpenCameraEvent) {
      File image = await ImagePicker.pickImage(
          imageQuality: 100, source: ImageSource.camera);
      yield ImageLoaded(image);
    } else if (event is OpenGalleryEvent) {
      File image = await ImagePicker.pickImage(source: ImageSource.gallery);
      yield ImageLoaded(image);
    }
  }
}
