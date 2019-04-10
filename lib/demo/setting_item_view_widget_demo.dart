import 'package:flutter/material.dart';
import 'package:flutter_action/view/setting_item_view_widget.dart';

class SettingItemViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ImageResolveDemo'),
      ),
      body: new SettingItemViewWidget(),
    );
  }
}
