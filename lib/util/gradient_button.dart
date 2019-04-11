import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  BoxDecoration _redGradientDecoration_normal = new BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xFFFF9282), Color(0xFFFF4436)]),
    borderRadius: BorderRadius.circular(30.0),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      width: double.infinity,
      decoration: _redGradientDecoration_normal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Text(
          "参与活动",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
