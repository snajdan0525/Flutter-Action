import 'package:flutter/material.dart';
import 'package:flutter_action/view/pull_to_refresh_header_stick_list_view.dart';

class PTRHeadListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    GlobalKey headKey_first = new GlobalKey();
    GlobalKey headKey_second = new GlobalKey();
    GlobalKey headKey_third = new GlobalKey();
//    return  PTRListViewWidget();
//      return SimpleDataViewWidget();
    Image image = new Image.asset(
      'data_repo/img/banner/header_img.png',
      key: headKey_first,
      height: 167.5,
      fit: BoxFit.fill,
    );
    return PTRHeaderListViewWidget(
      stickHeaderPos: 2,
      stickWidget: Container(
        alignment: Alignment.centerLeft,
        color: Color(0xfff3f4f5),
        padding: const EdgeInsets.only(left: 15.0),
        height: 50.0,
        child: Text("Stick fixed header view 2"),
      ),
      children: <Widget>[
        image,
        Container(
          key: headKey_second,
          alignment: Alignment.centerLeft,
          color: Color(0xfff3f4f5),
          padding: const EdgeInsets.only(left: 15.0),
          height: 50.0,
          child: Text("Stick fixed header view 1"),
        ),
        Container(
          key: headKey_third,
          alignment: Alignment.centerLeft,
          color: Color(0xfff3f4f5),
          padding: const EdgeInsets.only(left: 15.0),
          height: 50.0,
          child: Text("Stick fixed header view 2"),
        ),
      ],
    );
  }
}
