import 'package:flutter/material.dart';
import 'package:flutter_action/magic_change/magic_change_list_tile.dart';

class SettingItemViewWidget extends StatefulWidget {
  final String value;
  final String title;
  final bool showArrow;
  final Color titleColor;
  final Color valueColor;
  final double titleSize;
  final double valueSize;

  SettingItemViewWidget(
      {Key key,
      this.title,
      this.value,
      this.showArrow = true,
      this.titleColor = const Color(0xFF333333),
      this.valueColor = const Color(0xFF999999),
      this.titleSize = 15.0,
      this.valueSize = 13.0})
      : super(key: key);

  @override
  SettingItemViewWidgetState createState() => SettingItemViewWidgetState();
}

class SettingItemViewWidgetState extends State<SettingItemViewWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        color: Colors.white,
        child: new MagicListTile(
          contentPadding:
              EdgeInsets.only(top: 0.0, left: 16.0, right: 8.0, bottom: 0.0),
          leading: new Text(
            widget.title == null ? 'Title' : widget.title,
            style:
                TextStyle(color: widget.titleColor, fontSize: widget.titleSize),
          ),
          title: new Text(
            widget.value == null ? 'value' : widget.value,
            textAlign: TextAlign.right,
            style:
                TextStyle(color: widget.valueColor, fontSize: widget.valueSize),
          ),
          trailing: widget.showArrow ? Icon(Icons.keyboard_arrow_right) : null,
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
