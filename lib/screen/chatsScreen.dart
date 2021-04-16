import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/chatTile.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
              ChatTile(
                key: 'a',
                name: 'James Bond',
                text: 'This is a really long message to see if it will go over what we expected.',
                date: DateTime.now(),
              ),
              ChatTile(
                key: 'b',
                name: 'Joshua',
                text: 'Hello',
                date: DateTime.now(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
