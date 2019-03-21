import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CircleView extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return new CircleViewRenderBox();
  }
}

class CircleViewRenderBox extends RenderConstrainedBox {
  CircleViewRenderBox()
      : super(additionalConstraints: const BoxConstraints.expand());

  @override
  void handleEvent(PointerEvent event, HitTestEntry entry) {
    // TODO: implement handleEvent
    super.handleEvent(event, entry);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    Rect rect = Offset.zero & size;
    context.canvas.save();
    context.canvas.clipRRect(new RRect.fromRectXY(rect, 100.0, 100.0));
    context.canvas.drawPaint(new Paint()..color = Colors.red);
    context.canvas.drawPaint(new Paint()..color = Colors.white);
    context.canvas.restore();
  }
}
