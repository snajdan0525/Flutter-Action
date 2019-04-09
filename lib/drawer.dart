import 'package:flutter/material.dart';
import 'package:flutter_action/animation/fade.dart';
import 'package:flutter_action/demo/image_resolve_demo.dart';
import 'package:flutter_action/demo/pull_to_refresh_header_list_view_demo.dart';
import 'package:flutter_action/demo/section_stick_list_view_demo.dart';
import 'package:flutter_action/demo/pull_to_refresh_list_view_demo.dart';
import 'package:flutter_action/demo/simple_data_view_demo.dart';

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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "data_repo/img/ic_launcher.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "sNajdan",
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
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('PTRHeadListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new PTRHeadListViewDemo();
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('StickSectionListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new SectionStickListViewDemo();
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('PTRListViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new PTRListViewDemo();
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.bookmark),
                    title: const Text('SimpleDataViewDemo'),
                    onTap: () {
                      Navigator.push(context, new FadeRoute(builder: (context) {
                        return new SimpleDataViewDemo();
                      }));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
