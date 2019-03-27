import 'package:flutter/material.dart';

class PTRListView extends StatefulWidget {
  const PTRListView({Key key}) : super(key: key);

  static const String routeName = 'unknow';

  @override
  PTRListViewState createState() => PTRListViewState();
}

class PTRListViewState extends State<PTRListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
