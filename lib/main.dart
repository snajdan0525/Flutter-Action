import 'package:flutter/material.dart';
import 'pageview/first.dart';
import 'pageview/second.dart';
import 'pageview/third.dart';
import 'package:flutter_action/drawer.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(new MaterialApp(
    // Title
      title: "Using Tabs",
      // Home
      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  // Create a tab controller 
  TabController controller;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List tabs = ["Tab1", "Tab2", "Tab3"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: new MyDrawer(), //抽屉,
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("FlutterFrameWork"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
        bottom: TabBar(
          //生成Tab菜单
            controller: controller,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      // Set the TabBar view as the body of the Scaffold
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
