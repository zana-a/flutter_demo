import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/widgets/chats/messageTile.dart';
import 'package:flutter_app/src/widgets/chats/tile/presence.dart';
import 'package:flutter_app/src/widgets/chats/tile/status.dart';
// import 'package:flutter_app/src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(TempApp());
}

class TempApp extends StatefulWidget {
  @override
  _TempAppState createState() => _TempAppState();
}

class _TempAppState extends State<TempApp> {
  bool darkMode = false;
  int currentPage = 0;

  final List<Widget> _pages = [
    chatPage("Chats"),
    settingsPage("Settings"),
  ];

  static Widget chatPage(String title) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      body: ListView.separated(
        // physics: Theme.of(context).platform == TargetPlatform.iOS
        //     ? BouncingScrollPhysics()
        //     : ClampingScrollPhysics(),
        itemBuilder: (context, i) {
          return MessageTile(
            key: Key(''),
            name: 'Solaf',
            message: 'Hello There!',
            date: DateTime.now(),
            presence: Presence.None,
            messageStatus: Status.Delivered,
            profileImage: NetworkImage('https://picsum.photos/200'),
            counts: 20,
          );
        },
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0,
            thickness: 0.5,
            color: Colors.grey[300],
            indent: 54 + 16.0,
          );
        },
      ),
    );
  }

  static Widget settingsPage(String title) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      body: Text('Settings'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey[200]),
          ),
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble_2),
              activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              activeIcon: Icon(CupertinoIcons.settings_solid),
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
