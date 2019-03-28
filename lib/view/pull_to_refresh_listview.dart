import 'package:flutter/material.dart';
import 'dart:async';

/*
document url 
https://docs.flutter.io/flutter/material/RefreshIndicator-class.html
 */
class PTRListView extends StatefulWidget {
  const PTRListView({Key key}) : super(key: key);

  static const String routeName = 'unknow';

  @override
  PTRListViewState createState() => PTRListViewState();
}

class PTRListViewState extends State<PTRListView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  static final List<String> _items = <String>[
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('PTRListView'),
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              final String item = _items[index];
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(child: Text(item)),
                title: Text('This is $item item '),
                subtitle: const Text('Flutter is Google’s mobile UI framework for crafting high-quality native experiences on iOS and Android in record time. Flutter works with existing code,'),
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
  Future<void> _handleRefresh() {
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
}
