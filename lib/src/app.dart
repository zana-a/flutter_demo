import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/chats/chatsScreen.dart';
import 'package:flutter_app/src/screens/settings/settingsScreen.dart';
import 'package:flutter_app/src/screens/stories/exploreScreen.dart';

class App extends StatelessWidget {
  final List<Widget> _pages = [
    ChatScreen(
      title: 'Chats',
    ),
    ExploreScreen(
      title: 'Explore',
    ),
    SettingsScreen(
      title: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore_rounded),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
            ),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
      ),
    );
  }
}
