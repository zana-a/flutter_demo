import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/screen/chatsScreen.dart';
import 'package:flutter_app/screen/settingsScreen.dart';
// import 'package:flutter_app/screen/storiesScreen.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<Widget> _pages = [
    // StoriesScreen(),
    ChatsScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBuilder: (BuildContext context, index) => _pages[index],
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.white,
          items: [
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.public),
            // ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              activeIcon: Icon(CupertinoIcons.settings_solid),
            )
          ],
        ),
      ),
    );
  }
}





