import 'package:color_picker/values/values.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              flexibleSpace: Center(
                child: IconButton(
                  iconSize: 56.0,
                  color: Colors.white,
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ),
              expandedHeight: _usableScreenHeight * .55,
            ),
            SliverAppBar(
              title: const Text(Strings.gallery),
              backgroundColor: Colors.white,
              pinned: true,
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ImageCell(
                    index: index,
                  );
                },
                childCount: 30,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100.0,
                childAspectRatio: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _noPreview() {
    return Center(
      child: Text(Strings.emptyGallery),
    );
  }
}

class ImageCell extends StatelessWidget {
  final int index;

  const ImageCell({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("$index");
      },
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image.asset("assets/images/1.jpg"),
      ),
    );
  }
}
