import 'package:flutter/material.dart';
import 'package:flutter_action/model/city.dart';

typedef Widget ItemWidgetBuilder(BuildContext context, CityInfo data);

class StickSectionListViewWidget extends StatefulWidget {
  final int stickSectionHeight;
  final Widget stickSectionWidget;
  final int itemHeight;
  final List<CityInfo> data;
  final ItemWidgetBuilder itemBuilder;

  StickSectionListViewWidget({
    Key key,
    this.data,
    this.stickSectionWidget,
    this.itemHeight: 50,
    this.stickSectionHeight: 40,
    @required this.itemBuilder,
  }) : super(key: key);

  @override
  StickSectionListViewState createState() => StickSectionListViewState();
}

class StickSectionListViewState extends State<StickSectionListViewWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.itemBuilder(context, widget.data[index]);
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
