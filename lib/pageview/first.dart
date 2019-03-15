import 'package:flutter/material.dart';
import 'package:flutter_action/view/gridview.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new MyGridView().build(context),
    );
  }
}
