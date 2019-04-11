import 'package:flutter/material.dart';

class GradientButtonWidget extends StatefulWidget {
  final Function onTap;
  final String buttonText;

  GradientButtonWidget({Key key, this.buttonText, this.onTap})
      : super(key: key);

  @override
  GradientButtonWidgetState createState() => GradientButtonWidgetState();
}

class GradientButtonWidgetState extends State<GradientButtonWidget> {
  BoxDecoration _redGradientDecoration_normal = new BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xFFFF9282), Color(0xFFFF4436)]),
    borderRadius: BorderRadius.circular(30.0),
  );

  BoxDecoration _redGradientDecoration_pressed = new BoxDecoration(
    gradient: LinearGradient(colors: [Color(0xFFF88E7F), Color(0xFFE23828)]),
    borderRadius: BorderRadius.circular(30.0),
  );

  bool _isDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: widget.onTap,
      onTapDown: (d) => setState(() => _isDown = true),
      onTapUp: (d) => setState(() => _isDown = false),
      onTapCancel: () => setState(() => _isDown = false),
      child: new Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        width: double.infinity,
        decoration: _isDown
            ? _redGradientDecoration_pressed
            : _redGradientDecoration_normal,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            widget.buttonText == null ? '' : widget.buttonText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
