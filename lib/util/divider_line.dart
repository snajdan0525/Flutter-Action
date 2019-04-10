import 'package:flutter/material.dart';

class DividerLineWidget extends StatelessWidget {
  final double width;

  final double height;

  final Color color;

  DividerLineWidget(
      {Key key,
      this.width: double.infinity,
      this.height: 0.4,
      this.color: const Color(0xFFdedede)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: this.height,
        width: this.width,
        child: Container(color: this.color));
  }
}
