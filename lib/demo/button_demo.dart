import 'package:flutter/material.dart';
import 'package:flutter_action/util/gradient_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ButtonDemo'),
      ),
      body: new Center(
        child: new GradientButtonWidget(
          buttonText: '参与活动',
          onTap: () {
            Fluttertoast.showToast(
              msg: "Button Clicked",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
            );
          },
        ),
      ),
    );
  }

  void _toast() {}
}
