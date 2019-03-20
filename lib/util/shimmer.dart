import 'package:flutter/material.dart';

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
