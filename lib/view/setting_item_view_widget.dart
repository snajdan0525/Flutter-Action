import 'package:flutter/material.dart';

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
          child: new ListTile(
            leading: new Text(
              'Title',
              style: TextStyle(color: const Color(0xFF444444), fontSize: 15.0),
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
