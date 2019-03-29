import 'package:flutter/material.dart';
import 'package:flutter_action/view/pull_to_refresh_listview.dart';

class SimpleDataViewWidget extends StatefulWidget {
  const SimpleDataViewWidget({Key key}) : super(key: key);

  @override
  SimpleDataViewState createState() => SimpleDataViewState();
}

class SimpleDataViewState extends State<SimpleDataViewWidget>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 350));

  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleDataViewWidget'),
      ),
      body: new Stack(
        children: <Widget>[
          new Opacity(
            opacity: isLoading ? 1 : 0,
            child: PTRListViewWidget(),
          ),
          new Opacity(
            opacity: isLoading ? 0 : 1,
            child: _getProgress(),
          )
        ],
      ),
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
    animationController.dispose();
  }
}
