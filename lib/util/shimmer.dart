import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Shimmer extends StatefulWidget {
  @override
  _ShimmerState createState() => new _ShimmerState();

  Shimmer();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Shimmer oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
}

/*
我们的View继承于SingleChildRenderObjectWidget会默认实现一个createRenderObject方法
会返回一个RenderConstrainedBox
这个对象就是负责对你Widget的绘制和布局。
 */
class _Shimmer extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    return null;
  }

  @override
  SingleChildRenderObjectElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }
}


enum ShimmerDirection { ltr, rtl, ttb, btt }

class _ShimmerBox extends RenderProxyBox {
  final _clearPaint = Paint();
  final Paint _gradientPaint;
  final Gradient _gradient;
  final ShimmerDirection _direction;
  double _percent;
  Rect _rect;

  _ShimmerBox(this._percent, this._direction, this._gradient)
      : _gradientPaint = Paint()..blendMode = BlendMode.srcIn;

  @override
  bool get alwaysNeedsCompositing => child != null;


  set percent(double newValue) {
    if (newValue != _percent) {
      _percent = newValue;
      markNeedsPaint();
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final width = child.size.width;
    final height = child.size.height;
    Rect rect;
    double dx, dy;
    dx = _offset(-width, width, _percent);
    dy = 0.0;
    rect = Rect.fromLTWH(offset.dx - width, offset.dy, 3 * width, height);
    if (_rect != rect) {
      _gradientPaint.shader = _gradient.createShader(rect);
      _rect = rect;
    }
    context.canvas.saveLayer(offset & child.size, _clearPaint);
    context.paintChild(child, offset);
    context.canvas.translate(dx, dy);
    context.canvas.drawRect(rect, _gradientPaint);
    context.canvas.restore();
  }

  double _offset(double start, double end, double percent) {
    return start + (end - start) * percent;
  }

}
