part of 'asset_bloc.dart';

@immutable
abstract class AssetState {}

class AssetInitial extends AssetState {}

class AssetLoaded extends AssetState {
  final List<UintImageAsset> imageFiles;

  AssetLoaded(this.imageFiles);
}

class AssetChosen extends AssetState {
  final File imageFile;

  AssetChosen(this.imageFile);
}

class AssetLoadFailed extends AssetState {}
