import 'package:flutter/material.dart';

class ImageResolveDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Image image = new Image.network('https://i.stack.imgur.com/lkd0a.png');
    
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.resolve(new ImageConfiguration()).addListener(
        (ImageInfo info, bool _) => completer.complete(info.image));
    return null;
  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    new NetworkImage('https://i.stack.imgur.com/lkd0a.png')
        .resolve(new ImageConfiguration())
        .addListener(
            (ImageInfo info, bool _) => completer.complete(info.image));
    return completer.future;
  }
}
