import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

typedef OnImageLoadedFinishedCallback = void Function(ui.Image value);
typedef OnImageLoadedFailureCallback = void Function();

class BqImage extends StatelessWidget {
  final Image image;
  final OnImageLoadedFailureCallback onImageLoadedFailureCallback;
  final OnImageLoadedFinishedCallback onImageLoadedFinishedCallback;

  BqImage(
      {Key key,
      @required this.image,
      this.onImageLoadedFinishedCallback,
      this.onImageLoadedFailureCallback});

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _getImage(),
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.hasData) {
          if (onImageLoadedFinishedCallback != null) {
            this.onImageLoadedFinishedCallback(snapshot.data);
          }
          return image;
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return _getProgress();
        }
        if (!snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          if (onImageLoadedFailureCallback != null) {
            this.onImageLoadedFailureCallback();
          }
          return Text('No Data');
        }
      },
    );
  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.image.resolve(new ImageConfiguration()).addListener(
        (ImageInfo info, bool _) => completer.complete(info.image));
    return completer.future;
  }

  Widget _getProgress() {
    return Container(
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}
