import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/screens/chats/chatsScreen.dart';
import 'package:flutter_app/src/screens/settings/settingsScreen.dart';

class App extends StatelessWidget {
  final List<Widget> _pages = [
    ChatScreen(
      title: 'Chats',
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
