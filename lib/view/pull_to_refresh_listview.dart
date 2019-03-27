import 'package:flutter/material.dart';

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
          onRefresh: null,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                isThreeLine: true,
                leading: CircleAvatar(child: Text('aaa')),
                title: Text('This item represents'),
                subtitle: const Text(
                    'Even more additional list item information appears on line three.'),
              );
            },
          )),
    );
  }
}
