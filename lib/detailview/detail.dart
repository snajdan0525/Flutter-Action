import 'package:flutter/material.dart';
import 'package:flutter_action/detailview/CircleView.dart';
import 'package:flutter_action/view/pull_to_refresh_listview.dart';
import 'package:flutter_action/view/simple_data_view.dart';
import 'package:flutter_action/view/city_list_view.dart';
import 'package:flutter_action/view/pull_to_refresh_header_stick_list_view.dart';
class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return  PTRListViewWidget();
//      return SimpleDataViewWidget();
        return PTRHeaderListViewWidget();
//      return ChinaCityListViewWidget();
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
  }
}
