import 'package:flutter/material.dart';
import 'dart:async';

/*
document url 
https://docs.flutter.io/flutter/material/RefreshIndicator-class.html
 */
class PTRListViewWidget extends StatefulWidget {
  const PTRListViewWidget({Key key}) : super(key: key);

  static const String routeName = 'unknow';

  @override
  PTRListViewWidgetState createState() => PTRListViewWidgetState();
}

class PTRListViewWidgetState extends State<PTRListViewWidget> {
  bool isLoading = false; // 是否正在请求数据中
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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


  @override
  void initState() {
    super.initState();
    items.addAll(_items);
    _scrollController.addListener(() {
      // 如果下拉的当前位置到scroll的最下面
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
          _handleLoadMore();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('PTRListView'),
      ),
      body: RefreshIndicator(
          color: Colors.blue,
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemCount: items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == items.length) {
                return _buildLoadMoreProgressIndicator();
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
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

/*
  *
  * */
  Future _handleLoadMore() async {
    if (!isLoading ) {
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
