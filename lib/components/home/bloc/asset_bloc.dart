import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:color_picker/models/image_asset.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:storage_path/storage_path.dart';

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
    } else if (event is LoadImages) {
      yield* _mapLoadImages();
    } else if (event is PickImage) {
      yield* _mapPickImage(event.imageFile);
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

  Stream<AssetState> _mapLoadImages() async* {
    var jsonData = await StoragePath.imagesPath;
    Iterable imagePath = jsonDecode(jsonData);
    var imageAssets =
        imagePath.map((model) => ImageAsset.fromJson(model)).toList();
    List<Uint8List> imageFiles = [];
    List<String> imageFolder = ["Screenshots", "Camera"];
    for (var imageAsset in imageAssets) {
      if (!imageFolder.contains(imageAsset.folderName)) continue;
      int imageLoadLength =
          imageAsset.files.length >= 25 ? 25 : imageAsset.files.length;
      for (var imagePath in imageAsset.files.sublist(0, imageLoadLength)) {
        try {
          List<int> imageByte = await FlutterImageCompress.compressWithFile(
            imagePath,
            minHeight: 176,
            minWidth: 176,
            quality: 60,
            format: CompressFormat.jpeg,
          );
          var uIntImageByte = Uint8List.fromList(imageByte);
          imageFiles.add(uIntImageByte);
        } on FlutterError catch (e) {
          print(e);
        }
      }
    }
    yield AssetLoaded(imageFiles);
  }

  Stream<AssetState> _mapPickImage(File imageFile) async* {}

  Future<File> fetchImageAsset(ImageSource source) async {
    var imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile == null) return null;
    return imageFile;
  }
}
