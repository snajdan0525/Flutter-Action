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
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(child: Text('Avator')),
                title: Text(''),
                subtitle: const Text(''),
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
