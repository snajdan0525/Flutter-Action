import 'package:flutter/material.dart';
import 'package:flutter_action/animation/fade.dart';
import 'package:flutter_action/demo/image_resolve_demo.dart';
import 'package:flutter_action/demo/pull_to_refresh_header_list_view_demo.dart';
import 'package:flutter_action/demo/section_stick_list_view_demo.dart';
import 'package:flutter_action/demo/pull_to_refresh_list_view_demo.dart';
import 'package:flutter_action/demo/simple_data_view_demo.dart';
import 'package:flutter_action/demo/bottom_sheet_demo.dart';
import 'package:flutter_action/util/divider_line.dart';
import 'package:flutter_action/demo/setting_item_view_widget_demo.dart';
import 'package:flutter_action/demo/button_demo.dart';
import 'demo/common_dialog_demo.dart';
import 'package:flutter_action/demo/encap_bqimage_demo.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: ClipRect(
                      child: Image.asset(
                        "data_repo/img/logo.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "FlutterAction_Demo",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('ImageResolveDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new ImageResolveDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('PTRHeadListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new PTRHeadListViewDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('StickSectionListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new SectionStickListViewDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('PTRListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new PTRListViewDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('SimpleDataViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new SimpleDataViewDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('BottomViewWidgetDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new BottomSheetDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('SettingItemViewWidgetDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new SettingItemViewDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('ButtonDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new ButtonDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('DialogDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new DialogDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('EncapsilizeBqImageDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new EncapsilizeBqImageDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('FlutterPopupWindow'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new EncapsilizeBqImageDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('吸顶头部刷新ListView'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new EncapsilizeBqImageDemo();
                      }));
                    },
                  ),
                  DividerLineWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
