import 'package:flutter/material.dart';

class DialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DialogDemo'),
      ),
      body: Center(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () => _showPicDialogView(context),
                child: new Text('showPictureDialogView'),
              ),
              new RaisedButton(
                onPressed: () => _showAlertDilog(context),
                child: new Text('showAlertDilog'),
              ),
            ]),
      ),
    );
  }

  void _showAlertDilog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, //user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showPicDialogView(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0.0,
          child: new Image.asset(
            'data_repo/img/banner/header_img.png',
          ),
        );
      },
    );
  }
}
