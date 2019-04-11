import 'package:flutter/material.dart';
import 'package:flutter_action/util/gradient_button.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ButtonDemo'),
      ),
      body: new Center(
        child: new GradientButton(),
      ),
    );
  }
}
