import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/chats/messageTile.dart';
import 'package:flutter_app/src/widgets/chats/tile/presence.dart';
import 'package:flutter_app/src/widgets/chats/tile/status.dart';

class ChatScreen extends StatelessWidget {
  final String title;

  ChatScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        transitionBetweenRoutes: false,
        leading: navbarButton(
          child: Text('Edit'),
        ),
        middle: Text(title),
        trailing: navbarButton(
          child: Icon(CupertinoIcons.add_circled),
        ),
      ),
      backgroundColor: Colors.white,
      child: ListView.separated(
        itemBuilder: (context, i) {
          return MessageTile(
            key: Key(''),
            name: 'Zana',
            message: 'Hello There!',
            date: DateTime.now(),
            presence: Presence.None,
            messageStatus: Status.Delivered,
            profileImage: NetworkImage('https://picsum.photos/200'),
            counts: 12,
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

  Widget navbarButton({Widget child}) {
    return CupertinoButton(
      onPressed: () {},
      child: child,
      padding: EdgeInsets.zero,
      minSize: double.minPositive,
    );
  }
}

// ListView.separated(
// physics: Theme.of(context).platform == TargetPlatform.iOS
//     ? BouncingScrollPhysics()
//     : ClampingScrollPhysics(),
//     itemBuilder: (context, i) {
//       return MessageTile(
//         key: Key(''),
//         name: 'Solaf',
//         message: 'Hello There!',
//         date: DateTime.now(),
//         presence: Presence.None,
//         messageStatus: Status.Delivered,
//         profileImage: NetworkImage('https://picsum.photos/200'),
//         counts: 20,
//       );
//     },
//     itemCount: 20,
//     separatorBuilder: (BuildContext context, int index) {
//       return Divider(
//         height: 0,
//         thickness: 0.5,
//         color: Colors.grey[300],
//         indent: 54 + 16.0,
//       );
//     },
//   ),
// );
