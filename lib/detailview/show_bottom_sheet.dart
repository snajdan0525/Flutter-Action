import 'package:flutter/material.dart';
class BottomViewWidget extends StatefulWidget {
  const BottomViewWidget({Key key}) : super(key: key);

  @override
  BottomViewState createState() => BottomViewState();
}

class BottomViewState extends State<BottomViewWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  /*
  onPressed: () => _modalBottomSheetMenu(context), no exception
  onPressed: _modalBottomSheetMenu(context), throw setState() or markNeedsBuild() called during build exception
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('BottomViewWidget'),
      ),
      body: Center(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => _modalBottomSheetMenu(context),
                child: new Text('SHOW MODAL BOTTOM SHEET'),
              ),
              new RaisedButton(
                onPressed: () => _showPersistentBottomSheet(context),
                child: new Text('SHOW Persistent BOTTOM SHEET'),
              ),
            ]),
      ),
    );
  }

  void _showPersistentBottomSheet(BuildContext context) {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      final ThemeData themeData = Theme.of(context);
      return Container(
//          decoration: BoxDecoration(
//              border: Border(top: BorderSide(color: themeData.disabledColor))),
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                  'This is a Material persistent bottom sheet. Drag downwards to dismiss it.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: themeData.accentColor, fontSize: 24.0))));
    });
  }

  _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            height: 350.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: new Center(
                  child: new Text("This is a modal sheet"),
                )),
          );
        });
  }
}
