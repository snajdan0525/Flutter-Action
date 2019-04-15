import 'package:flutter/material.dart';
import 'package:flutter_action/view/dialog/bq_loading_dialog.dart';
import 'package:flutter_action/view/dialog/bq_alert_dialog.dart';

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
                onPressed: () => _showAlertDialog(context),
                child: new Text('showAlertDialog'),
              ),
              new RaisedButton(
                onPressed: () => _showBQAlertDialog(context),
                child: new Text('showBQAlertDialog'),
              ),
              new RaisedButton(
                onPressed: () => _showLoadingDilog(context),
                child: new Text('showLoadingDilog'),
              ),
            ]),
      ),
    );
  }

  void _showLoadingDilog(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            //调用对话框
            text: '正在获取详情...',
          );
        });
  }

  void _showAlertDialog(BuildContext context) {
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

  void _showBQAlertDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false, //user must tap button!
      builder: (BuildContext context) {
        return BqAlertDialog(
          title: Text('提示'),
          showRightButton: true,
          showLeftButton: true,
          content: Text('是否注销账号'),
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
