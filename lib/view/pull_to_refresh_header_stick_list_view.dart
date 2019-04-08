import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_action/view/photo_gridview.dart';
/*
document url 
https://docs.flutter.io/flutter/material/RefreshIndicator-class.html
 */
class PTRHeaderListViewWidget extends StatefulWidget {
  final List<Widget> children;
  final int stickHeaderPos;
  final Widget stickWidget;

  const PTRHeaderListViewWidget({
    Key key,
    this.children = const <Widget>[],
    this.stickHeaderPos = 0,
    this.stickWidget,
  }) : super(key: key);

  static const String routeName = 'unknow';

  @override
  PTRHeaderListViewWidgetState createState() => PTRHeaderListViewWidgetState();
}

class PTRHeaderListViewWidgetState extends State<PTRHeaderListViewWidget> {
  bool isLoading = false; // 是否正在请求数据中
  bool _visable = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  List items = new List();
  static final List _items = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N'
  ];

  ScrollController _scrollController = new ScrollController();
  int _headerCount;
  Widget _stickWidget;
  double _stickWidgetHeight;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    items.addAll(_items);
    _init();
    _scrollController.addListener(() {
      _handleStick(_scrollController.offset);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 如果下拉的当前位置到scroll的最下面
        _handleLoadMore();
      }
    });
  }

  double _stickOffset = 0.0;

  _handleStick(double offset) {
    if (offset >= _stickOffset)
      setState(() {
        _visable = true;
      });
    else {
      setState(() {
        _visable = false;
      });
    }
  }

  _afterLayout(_) {
    for (int i = 0; i < widget.stickHeaderPos; i++) {
      GlobalKey headerKey = widget.children[i].key;
      _stickOffset = _stickOffset +
          headerKey.currentContext.findRenderObject().paintBounds.size.height;
      print('_stickOffset $_stickOffset');
    }

    GlobalKey stickKey = widget.children[widget.stickHeaderPos].key;
    _stickWidgetHeight =
        stickKey.currentContext.findRenderObject().paintBounds.size.height;
    print('_stickWidgetHeight $_stickWidgetHeight');
  }

  void _init() {
    _headerCount = widget.children.length;
    _stickWidget = widget.stickWidget;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      RefreshIndicator(
          color: Colors.blue,
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          child: ListView.builder(
            controller: _scrollController,
            cacheExtent: 10.0,
            itemCount: items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              print('index $index');
              if (index == items.length) {
                return _buildLoadMoreProgressIndicator();
              }
              if (index <= _headerCount - 1) {
                return widget.children[index];
              }
              final String item = items[index];
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(child: Text(item)),
                title: Text('This is $item item '),
                subtitle: const Text(
                    'Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing code,'),
              );
            },
          )),
    ];
    if (widget.stickWidget != null) {
      children.add(Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: Opacity(
          opacity: _visable ? 1.0 : 0.0,
          child: widget.stickWidget,
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('PTRHeadListView'),
      ),
      body: Stack(children: children),
    );
  }

  /**
   * The completer completes the future asynchronously. That means that
   * callbacks registered on the future are not called immediately when
   * [complete] or [completeError] is called. Instead the callbacks are
   * delayed until a later microtask.
   */
  Future<void> _handleRefresh() async {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      print('_handleRefresh');
    });
  }

/*
  *
  * */
  Future _handleLoadMore() async {
    if (!isLoading) {
      // 如果上一次异步请求数据完成 同时有数据可以加载
      if (mounted) {
        setState(() => isLoading = true);
      }
      List newEntries = await mokeHttpRequest();
      if (this.mounted) {
        setState(() {
          items.addAll(newEntries);
          isLoading = false;
        });
      }
    }
  }

  /*
  * moke数据
  */
  Future<List> mokeHttpRequest() async {
    return Future.delayed(Duration(seconds: 2), () {
      return _items;
    });
  }

  Widget _buildLoadMoreProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
          child: Column(
        children: <Widget>[
          new Opacity(
            opacity: isLoading ? 1.0 : 0.0,
            child: new CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation(Colors.blue)),
          ),
          SizedBox(height: 10.0),
          Text(
            'LoadingMore......',
            style: TextStyle(fontSize: 14.0),
          )
        ],
      )
          //child:
          ),
    );
  }
}
