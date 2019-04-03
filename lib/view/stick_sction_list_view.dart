import 'package:flutter/material.dart';
import 'package:flutter_action/model/city.dart';

class StickSectionListViewWidget extends StatefulWidget {
  final int stickSectionHeight;
  final Widget stickSectionWidget;
  final int itemHeight;
  final List<CityInfo> data;
  final AsyncWidgetBuilder itemBuilder;

  StickSectionListViewWidget({
    Key key,
    this.data,
    this.stickSectionWidget,
    this.itemHeight: 50,
    this.stickSectionHeight: 40,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  State createState() {}
}

class StickSectionListViewState extends State<StickSectionListViewWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
