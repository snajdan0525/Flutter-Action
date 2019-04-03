import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_action/model/city.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:lpinyin/lpinyin.dart';
import 'package:flutter_action/view/stick_sction_list_view.dart';

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
  int _stickSectionHeight = 40;
  int _itemHeight = 50;

  String sectionTag = 'A';

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
      _setShowStickSectionStatus(_cityList);
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

  /// set show sitck section status.
  void _setShowStickSectionStatus(List<CityInfo> list) {
    if (list == null || list.isEmpty) return;
    String tempTag;
    for (int i = 0, length = list.length; i < length; i++) {
      String alphaTag = list[i].getAlphaTag();
      if (tempTag != alphaTag) {
        tempTag = alphaTag;
        list[i].isShowStickSection = true;
      } else {
        list[i].isShowStickSection = false;
      }
    }
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
//              return ListView.builder(
//                  itemCount: _cityList.length,
//                  itemBuilder: (BuildContext context, int index) {
//                    return _buildListItemWidget(_cityList[index]);
//                  });
              return StickSectionListViewWidget(
                data: _cityList,
                stickSectionWidget: _buildStickSectionWidget(sectionTag),
                stickSectionHeight: _stickSectionHeight,
                itemHeight: _itemHeight,
                itemBuilder: (context, data) => _buildListItemWidget(data),
                onStickSectionTagChanged: _onStickSectionTagChanged,
              );
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

  Widget _buildStickSectionWidget(String stickSectionTag) {
    return Container(
      height: _stickSectionHeight.toDouble(),
      //40
      padding: const EdgeInsets.only(left: 15.0),
      color: Color(0xfff3f4f5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$stickSectionTag',
        softWrap: false,
        style: TextStyle(
          fontSize: 14.0,
          color: Color(0xff999999),
        ),
      ),
    );
  }

  Widget _buildListItemWidget(CityInfo itemData) {
    String alphaTag = itemData.getAlphaTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: itemData.isShowStickSection != true,
          child: _buildStickSectionWidget(alphaTag),
        ),
        SizedBox(
          height: _itemHeight.toDouble(), //50
          child: ListTile(
            title: Text(itemData.name),
          ),
        )
      ],
    );
  }

  void _onStickSectionTagChanged(String tag) {
    setState(() {
      sectionTag = tag;
    });
  }
}
