part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent {}

class OpenCamera extends AssetEvent {}

class PickImage extends AssetEvent {
  final String imagePath;

  PickImage(this.imagePath);
}

class OpenImagePicker extends AssetEvent {}
