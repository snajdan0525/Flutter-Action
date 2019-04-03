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
  ScrollController _scrollController;
  Map<String, int> _stickSectionOffsetMap = new Map();
  List<int> _stickSectionOffsetList = new List();
  int _stickMarginTop = 0;
  int _lastIndex = 0;

  @override
  void initState() {
    super.initState();
    _init();
    _scrollController = new ScrollController()
      ..addListener(() {
        int offset = _scrollController.offset.toInt();
        int _index = _getIndex(offset);
        if (_index != -1 && _lastIndex != _index) {
          _lastIndex = _index;
          if (widget.onSusTagChanged != null) {
            widget.onSusTagChanged(_suspensionSectionMap.keys.toList()[_index]);
          }
        }
      });
  }

  void _init() {
    _stickSectionOffsetMap.clear();
    int offset = 0;
    String alphaTag;
    widget.data?.forEach((item) {
      if (alphaTag != item.getAlphaTag()) {
        alphaTag = item.getAlphaTag();
        _stickSectionOffsetMap.putIfAbsent(alphaTag, () => offset);
        offset = offset + widget.stickSectionHeight + widget.itemHeight;
      } else {
        offset = offset + widget.itemHeight;
      }
    });
    _stickSectionOffsetList
      ..clear()
      ..addAll(_stickSectionOffsetMap.values);
  }

  int _getIndex(int offset) {
    int length = _stickSectionOffsetList.length;
    for (int i = 0; i < length - 1; i++) {
      int space = _stickSectionOffsetList[i + 1] - offset;
      if (space > 0 && space < widget.stickSectionHeight) {
        space = space - widget.itemHeight;
      } else {
        space = 0;
      }
      if (_stickMarginTop != space && widget.stickSectionWidget != null) {
        setState(() {
          _stickMarginTop = space;
        });
      }
      int a = _stickSectionOffsetList[i];
      int b = _stickSectionOffsetList[i + 1];
      if (offset >= a && offset < b) {
        return i;
      }
      if (offset >= _stickSectionOffsetList[length - 1]) {
        return length - 1;
      }
    }
    return -1;
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return widget.itemBuilder(context, widget.data[index]);
          }),
    ];

    if (widget.stickSectionWidget != null) {
      children.add(Positioned(
        top: _stickMarginTop.toDouble() - 0.1,
        left: 0.0,
        right: 0.0,
        child: widget.stickSectionWidget,
      ));
    }
    return Stack(children: children);

//    return ListView.builder(
//        itemCount: widget.data.length,
//        itemBuilder: (BuildContext context, int index) {
//          return widget.itemBuilder(context, widget.data[index]);
//        });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
