import 'package:flutter/material.dart';
import 'package:flutter_action/detailview/detail.dart';
import 'package:flutter_action/animation/fade.dart';
class MyGridView {
  InkWell getStructuredGridCell(BuildContext context,name, image) {
    return InkWell(
      onTap: () {
        Navigator.push( context,
            new FadeRoute(builder: (context) {
              return new DetailView();
            }));
      },
      child:new Card(
          elevation: 1.5,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              new Image(image: new AssetImage('data_repo/img/' + image)),
              new Center(
                child: new Text(name),
              )
            ],
          )),

    );
  }

  GridView build(BuildContext context ) {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,

      children: <Widget>[
        getStructuredGridCell(context,"Facebook", "social/facebook.png"),
        getStructuredGridCell(context,"Twitter", "social/twitter.png"),
        getStructuredGridCell(context,"Instagram", "social/instagram.png"),
        getStructuredGridCell(context,"Linkedin", "social/linkedin.png"),
        getStructuredGridCell(context,"Gooogle Plus", "social/google_plus.png"),
        getStructuredGridCell(context,"Launcher Icon", "ic_launcher.png"),
      ],
    );
  }
}
