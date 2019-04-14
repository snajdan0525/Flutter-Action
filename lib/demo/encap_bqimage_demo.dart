import 'package:flutter/material.dart';
import 'package:flutter_action/view/bq_image.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EncapsilizeBqImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('EncapsilizeBqImageDemo'),
      ),
      body: new Center(
        child: new BqImageWidget(
          image: new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1555048780910&di=f11c886208c830a7ad3d8665fd7bf261&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F038997a566b8db96ac7256b29b9246b.jpg'),
          onImageLoadedFinishedCallback: (data) {
            print('onImageLoadedFinishedCallback');
            Fluttertoast.showToast(
              msg: '${data.width}x${data.height}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
            );
          },
          onImageLoadedFailureCallback: () {
            Fluttertoast.showToast(
              msg: "loaded failure",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
            );
          },
        ),
      ),
    );
  }
}
