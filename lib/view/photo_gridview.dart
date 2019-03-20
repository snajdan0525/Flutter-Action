import 'package:flutter/material.dart';
import 'package:flutter_action/model/photo.dart';
import 'package:flutter_action/view/photoitemview.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class PhotoGridWidget extends StatefulWidget {
  const PhotoGridWidget({Key key}) : super(key: key);

  static const String routeName = '/material/grid-list';

  @override
  PhotoGridState createState() => PhotoGridState();
}

class PhotoGridState extends State<PhotoGridWidget> {
  List<Photo> photos = <Photo>[
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735122710/1545878949_-888937974_12286_sProdImgNo_2.jpg/0',
      title: '杨戬',
      caption: '根源之目',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735122914/1546066640_-888937974_2303_sProdImgNo_2.jpg/0',
      title: '杨戬',
      caption: '永耀之星',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735021815/1550476460_587358052_23962_sProdImgNo_2.jpg/0',
      title: '花木兰',
      caption: '瑞麟志',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011815/1547798130_704174346_32730_sProdImgNo_2.jpg/0',
      title: '花木兰',
      caption: '水晶猎龙者',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735012117/1548064556_587358052_24401_sProdImgNo_2.jpg/0',
      title: '花木兰',
      caption: '冠军飞将',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011016/1547110738_-888937974_9300_sProdImgNo_2.jpg/0',
      title: '关羽',
      caption: '冰封战神',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735012117/1548063533_-888937974_32215_sProdImgNo_2.jpg/0',
      title: '吕布',
      caption: '猎兽之王',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011017/1547112240_-888937974_22130_sProdImgNo_2.jpg/0',
      title: '李白',
      caption: '凤求凰',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011818/1547805942_-695593207_9824_sProdImgNo_2.jpg/0',
      title: '貂蝉',
      caption: '仲夏夜之梦',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011016/1547110738_-888937974_9300_sProdImgNo_2.jpg/0',
      title: '关羽',
      caption: '冰封战神',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011818/1547805942_-695593207_9824_sProdImgNo_2.jpg/0',
      title: '貂蝉',
      caption: '仲夏夜之梦',
    ),
    Photo(
      photoUrl:
          'http://shp.qpic.cn/ishow/2735011017/1547112240_-888937974_22130_sProdImgNo_2.jpg/0',
      title: '李白',
      caption: '凤求凰',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      primary: true,
      childAspectRatio: 1.0,
      children: photos.map<Widget>((photo) => new GridDemoPhotoItem(
              photo: photo,
              onBannerTap: (Photo photo) {
                setState(() {
                  photo.isFavorite = !photo.isFavorite;
                });
              })).toList(),
    );
  }
}
