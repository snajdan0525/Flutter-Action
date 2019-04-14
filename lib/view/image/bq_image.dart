import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:async';

typedef OnImageLoadedFinishedCallback = void Function(ui.Image value);
typedef OnImageLoadedFailureCallback = void Function();

class BqImageWidget extends StatefulWidget {
  final Image image;
  final OnImageLoadedFailureCallback onImageLoadedFailureCallback;
  final OnImageLoadedFinishedCallback onImageLoadedFinishedCallback;

  BqImageWidget(
      {Key key,
      @required this.image,
      this.onImageLoadedFinishedCallback,
      this.onImageLoadedFailureCallback});

  @override
  BqImageWidgetState createState() => BqImageWidgetState();
}

class BqImageWidgetState extends State<BqImageWidget> {
  Future<ui.Image> _future;
  Completer<ui.Image> completer;
  bool _hasEnter = false;

  @override
  void initState() {
    completer = new Completer<ui.Image>();
    _future = _getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.hasData) {
          if (!_hasEnter) {
            _hasEnter = true;
            if (widget.onImageLoadedFinishedCallback != null) {
              widget.onImageLoadedFinishedCallback(snapshot.data);
            }
          }
          return widget.image;
        }
        if (snapshot.connectionState != ConnectionState.done) {
          return _getProgress();
        }
        if (!snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          if (widget.onImageLoadedFailureCallback != null) {
            widget.onImageLoadedFailureCallback();
          }
          return Text('No Data');
        }
      },
    );
  }

  Future<ui.Image> _getImage() async {
    widget.image.image.resolve(new ImageConfiguration()).addListener(
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

  @override
  void didUpdateWidget(BqImageWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
}
