import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/chats.dart';
import 'package:flutter_app/util/Date.dart';
import 'package:flutter_app/widgets/chatTile.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          backgroundColor: CupertinoColors.white,
          largeTitle: Text('Chats'),
          leading: CupertinoButton(
            onPressed: () {},
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.zero,
            child: Text('Edit'),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
            onPressed: () {},
            child: Icon(CupertinoIcons.plus_square),
          ),
          stretch: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 16,
                    ),
                    child: CupertinoSearchTextField(),
                  ),
                  Divider(
                    height: 0,
                    color: CupertinoColors.systemGrey3,
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ChatTile(
              key: chats[index]['key'],
              name: chats[index]['name'] == null
                  ? 'Check Me'
                  : chats[index]['name'],
              message: chats[index]['message'],
              date: chats[index]['date'],
            );
          }, childCount: chats.length),
        )
      ],
    );
  }
}
