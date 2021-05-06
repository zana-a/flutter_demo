import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
              icon: Padding(
                padding: EdgeInsets.only(left: 42),
                child: Icon(CupertinoIcons.chat_bubble_2),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(left: 42),
                child: Icon(CupertinoIcons.chat_bubble_2),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.globe),
              activeIcon: Icon(CupertinoIcons.globe),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(right: 42),
                child: Icon(CupertinoIcons.settings),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(right: 42),
                child: Icon(CupertinoIcons.settings_solid),
              ),
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
