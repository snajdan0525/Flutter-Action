import 'package:flutter/material.dart';
import 'package:flutter_action/magic_change/magic_change_list_tile.dart';

class SettingItemViewWidget extends StatefulWidget {
  final String value;
  final String title;

  SettingItemViewWidget({Key key, this.title, this.value}) : super(key: key);

  @override
  SettingItemViewState createState() => SettingItemViewState();
}

class SettingItemViewState extends State<SettingItemViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
          color: Colors.white,
          child: new MagicListTile(
            contentPadding: EdgeInsets.only(top: 0.0, left: 16.0, right: 8.0, bottom: 0.0),
            title: new Text(
              'Value',
              textAlign: TextAlign.right,
              style: TextStyle(color: const Color(0xFF999999), fontSize: 13.0),
            ),
            leading: new Text(
              'Title',
              style: TextStyle(color: const Color(0xFF333333), fontSize: 15.0),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
