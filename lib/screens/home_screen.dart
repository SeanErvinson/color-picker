import 'package:color_picker/components/commons/apparaise_screen_arguments.dart';
import 'package:color_picker/components/home/bloc/asset_bloc.dart';
import 'package:color_picker/models/uint_image_asset.dart';
import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  List<UintImageAsset> _images;
  @override
  Widget build(BuildContext context) {
    final _usableScreenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return SafeArea(
      child: BlocListener<AssetBloc, AssetState>(
        listener: (context, state) {
          if (state is AssetChosen) {
            Navigator.of(context).pushNamed("appraise",
                arguments: AppraiseScreenArguments(state.imageFile));
          }
        },
        child: BlocBuilder<AssetBloc, AssetState>(
          builder: (context, state) {
            if (state is AssetLoaded) {
              _images = state.imageFiles;
            }
            return Scaffold(
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: greyPrimary,
                    centerTitle: true,
                    flexibleSpace: CameraButton(),
                    expandedHeight: _usableScreenHeight * .55,
                  ),
                  SliverAppBar(
                    title: const Text(Strings.gallery),
                    backgroundColor: Colors.white,
                    pinned: true,
                  ),
                  ImageGrid(
                    images: _images,
                  ),
                ],
              ),
            );
          },
        ),
        bloc: BlocProvider.of<AssetBloc>(context),
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetBloc _bloc = BlocProvider.of<AssetBloc>(context);
    return Center(
      child: IconButton(
        iconSize: 56.0,
        color: Colors.white,
        icon: const Icon(Icons.camera_alt),
        onPressed: () => _bloc.add(OpenCamera()),
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<UintImageAsset> _images;

  const ImageGrid({Key key, List<UintImageAsset> images})
      : this._images = images,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0) return GalleryCell();
          if (_images != null) return ImageCell(assetFile: _images[--index]);
        },
        childCount: _images == null ? 1 : _images.length + 1,
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
        childAspectRatio: 1,
      ),
    );
  }
}

class GalleryCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetBloc _bloc = BlocProvider.of<AssetBloc>(context);
    return GestureDetector(
      onTap: () => _bloc.add(OpenImagePicker()),
      child: Container(
        color: greySecondary,
        child: Icon(Icons.photo_library),
      ),
    );
  }
}

class ImageCell extends StatelessWidget {
  final UintImageAsset assetFile;
  const ImageCell({Key key, this.assetFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetBloc _bloc = BlocProvider.of<AssetBloc>(context);
    return GestureDetector(
      onTap: () => _bloc.add(PickImage(assetFile.fileName)),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.memory(assetFile.imageList),
      ),
    );
  }
}
