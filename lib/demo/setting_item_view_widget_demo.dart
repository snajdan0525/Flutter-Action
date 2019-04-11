import 'package:flutter/material.dart';
import 'package:flutter_action/view/setting_item_view_widget.dart';
import 'package:flutter_action/util/divider_line.dart';

class SettingItemViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('SettingItemViewDemo'),
      ),
      body: new Column(
        children: <Widget>[
          new SettingItemViewWidget(),
          new DividerLineWidget(),
          new SettingItemViewWidget(),
          new DividerLineWidget(),
          new SettingItemViewWidget(),
          new DividerLineWidget(),
          new SettingItemViewWidget(),
        ],
      ),
    );
  }
}
