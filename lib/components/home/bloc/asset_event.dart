part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent {}

class OpenCamera extends AssetEvent {}

class PickImage extends AssetEvent {
  final File imageFile;

  PickImage(this.imageFile);
}

class LoadImages extends AssetEvent {}

class OpenImagePicker extends AssetEvent {}
