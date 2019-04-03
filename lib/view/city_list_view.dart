import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_action/model/city.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:lpinyin/lpinyin.dart';

class ChinaCityListViewWidget extends StatefulWidget {
  const ChinaCityListViewWidget({Key key}) : super(key: key);

  @override
  ChinaCityListViewState createState() => ChinaCityListViewState();
}

class ChinaCityListViewState extends State<ChinaCityListViewWidget>
    with TickerProviderStateMixin {
  List<CityInfo> _cityList = List();
  AnimationController _animationController;
  StreamController _postsController;

  @override
  void initState() {
    super.initState();
    _postsController = new StreamController();
    loadCityData();
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 350));
  }

  loadCityData() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  Future fetchPost([howMany = 5]) async {
    //load city list data
    rootBundle.loadString('data_repo/city/china.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((value) {
        _cityList.add(CityInfo(name: value['name']));
      });
      _sortCityList(_cityList);
    });

    return Future.delayed(Duration(milliseconds: 1500), () {
      return _cityList;
    });
  }

  void _sortCityList(List<CityInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].alphaTag = tag;
      } else {
        list[i].alphaTag = "#";
      }
    }
    _cityList.sort((a, b) => a.alphaTag.compareTo(b.alphaTag));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('China City List'),
      ),
      body: StreamBuilder(
          stream: _postsController.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: _cityList.length,
                  itemExtent: 50.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text(_cityList[index].name));
                  });
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return _getProgress();
            }
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Text('No Data');
            }
          }),
    );
  }

  Widget _getProgress() {
    return Container(
      child: new Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
