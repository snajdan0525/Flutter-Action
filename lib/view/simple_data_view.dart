import 'package:flutter/material.dart';
import 'package:flutter_action/view/pull_to_refresh_listview_without_appbar.dart';
import 'dart:async';

class SimpleDataViewWidget extends StatefulWidget {
  const SimpleDataViewWidget({Key key}) : super(key: key);

  @override
  SimpleDataViewState createState() => SimpleDataViewState();
}

class SimpleDataViewState extends State<SimpleDataViewWidget>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  StreamController _postsController;

  @override
  void initState() {
    super.initState();
    _postsController = new StreamController();
    loadPosts();
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 350));
  }

  loadPosts() async {
    fetchPost().then((res) async {
      _postsController.add(res);
      return res;
    });
  }

  Future fetchPost([howMany = 5]) async {
    return Future.delayed(Duration(seconds: 2), () {
      return 'Data has loaded';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDataViewWidget'),
      ),
      body: StreamBuilder(
          stream: _postsController.stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return PTRListViewWidget();
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
