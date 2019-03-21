import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleView extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return new CircleViewRenderBox();
  }
}

class CircleViewRenderBox extends RenderConstrainedBox {
  CircleViewRenderBox()
      : super(additionalConstraints: const BoxConstraints.expand());

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    super.handleEvent(event, entry);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    /*this code copied from paintint.dart's classs function savelayer */
//    Rect rect = Offset.zero & size;
//    context.canvas.save();
//    context.canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
//    context.canvas.drawPaint(new Paint()..color = Colors.red);
//    context.canvas.drawPaint(new Paint()..color = Colors.white);
//    context.canvas.restore();
    Paint _paint = new Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;
    context.canvas.drawCircle(Offset(100, 100), 80, _paint);
  }
}
