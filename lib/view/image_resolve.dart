import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';

class ImageResolveDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Image image = new Image.network('https://i.stack.imgur.com/lkd0a.png');
//    Completer<ui.Image> completer = new Completer<ui.Image>();
//    image.image.resolve(new ImageConfiguration()).addListener(
//        (ImageInfo info, bool _) => completer.complete(info.image));
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('ImageResolveDemo'),
        ),
        body: new Center(
          child: new FutureBuilder<ui.Image>(
              future: _getImage(),
              builder:
                  (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                if (snapshot.hasData) {
                  return new Card(
                      elevation: 1.5,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          image,
                          new Center(
                            child: new Text(
                                '${snapshot.data.width}x${snapshot.data.height}'),
                          )
                        ],
                      ));
                }
                else  {
                  return new Text('Loading');
                }
              }),
        ));
  }

  Image image;

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image = new Image.network('https://picsum.photos/300/300/?random');
    image.image.resolve(new ImageConfiguration()).addListener(
        (ImageInfo info, bool _) => completer.complete(info.image));
    return completer.future;
  }
}
