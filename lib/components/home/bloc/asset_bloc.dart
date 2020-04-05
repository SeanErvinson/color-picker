import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:color_picker/models/uint_image_asset.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  @override
  AssetState get initialState => AssetInitial();

  @override
  Stream<AssetState> mapEventToState(
    AssetEvent event,
  ) async* {
    if (event is OpenCamera) {
      yield* _mapOpenCamera();
    } else if (event is OpenImagePicker) {
      yield* _mapOpenImagePicker();
    } else if (event is PickImage) {
      yield* _mapPickImage(event.imagePath);
    }
  }

  Stream<AssetState> _mapOpenCamera() async* {
    var imageFile = await fetchImageAsset(ImageSource.camera);
    if (imageFile == null)
      yield AssetLoadFailed();
    else
      yield AssetChosen(imageFile);
  }

  Stream<AssetState> _mapOpenImagePicker() async* {
    var imageFile = await fetchImageAsset(ImageSource.gallery);
    if (imageFile == null)
      yield AssetLoadFailed();
    else
      yield AssetChosen(imageFile);
  }

  Stream<AssetState> _mapPickImage(String imagePath) async* {
    var imageFile = File(imagePath);
    if (imageFile == null) {
      yield AssetLoadFailed();
    } else {
      yield AssetChosen(imageFile);
    }
  }

  Future<File> fetchImageAsset(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile == null) return null;
    return imageFile;
  }
}
