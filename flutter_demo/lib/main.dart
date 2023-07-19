

import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/Group/group.dart';
import 'package:flutter_demo/Pages/Home/home.dart';
import 'package:flutter_demo/Pages/Mall/mall.dart';
import 'package:flutter_demo/Pages/Profile/profile.dart';
import 'package:flutter_demo/Pages/Subject/subject.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {

  final color_theme = Colors.green;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "豆瓣",
      theme: ThemeData(
        primarySwatch: color_theme,
        iconTheme: IconThemeData(color: color_theme),
        highlightColor:  Colors.transparent,
        splashColor: Colors.transparent
      ),
      home: MyStackPage(),
    );
  }
}


class MyStackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyStackPageState();
  }

}
class MyStackPageState extends State<MyStackPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          createItem("home", "首页"),
          createItem("subject", "书影音"),
          createItem("group", "小组"),
          createItem("mall", "市集"),
          createItem("profile", "我的"),
        ],
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });
        },
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          home(),
          subject(),
          group(),
          mall(),
          profile()
        ],
      ),
    );
  }
}



BottomNavigationBarItem createItem(String iconName, String title) {
  return  BottomNavigationBarItem(
      icon: Image.asset("assets/images/tabbar/$iconName.png",width: 32.0,),
      activeIcon: Image.asset("assets/images/tabbar/${iconName}_active.png",width: 32.0,),
      label: "");
}
