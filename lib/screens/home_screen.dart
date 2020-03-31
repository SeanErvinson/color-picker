import 'dart:io';

import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _usableScreenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
            ImageGrid(),
          ],
        ),
      ),
    );
  }
}

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 56.0,
        color: Colors.white,
        icon: const Icon(Icons.camera_alt),
        onPressed: () {},
      ),
    );
  }
}

class ImageGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return GalleryCell();
        },
        childCount: 1,
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
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: greySecondary,
        child: Icon(Icons.photo_library),
      ),
    );
  }
}

class ImageCell extends StatelessWidget {
  final File imageFile;
  const ImageCell({Key key, this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset(imageFile.path),
      ),
    );
  }
}
