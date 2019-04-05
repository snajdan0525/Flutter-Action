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
    return PTRHeaderListViewWidget(
      stickHeaderPos: 0,
      children: <Widget>[
        Image(image: new AssetImage('data_repo/img/banner/header_img.png')),
        Container(
          alignment: Alignment.centerLeft,
          color: Color(0xfff3f4f5),
          padding: const EdgeInsets.only(left: 15.0),
          height: 50.0,
          child: Text("Stick fixed header view"),
        ),
      ],
    );
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
