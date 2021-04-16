import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/messages.dart';
import 'package:flutter_app/screen/profileScreen.dart';
import 'package:flutter_app/widgets/conversationBubble.dart';

class ConversationScreen extends StatelessWidget {
  final String name;

  ConversationScreen({this.name});

  Widget navigator({context: BuildContext}) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white,
      middle: Text(this.name),
      trailing: GestureDetector(
        onTap: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return ProfileScreen(name: this.name);
          }));
        },
        child: CircleAvatar(
          radius: 16,
          backgroundColor: CupertinoColors.systemGrey,
        ),
      ),
    );
  }

  Widget body() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://wallpaperaccess.com/full/1159179.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ConversationBubble(
                    message: messages[index]['message'],
                    date: messages[index]['date'],
                    isRead: messages[index]['isRead'] == null ? false : true,
                    isInBound:
                        messages[index]['isInBound'] == null ? false : true,
                    isDateToken:
                        messages[index]['isInBound'] == null ? false : true,
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              border: Border(
                top: BorderSide(
                  color: CupertinoColors.systemGrey6,
                  width: 1,
                ),
              ),
            ),
            child: SizedBox(
              child: Container(
                color: CupertinoColors.secondarySystemBackground,
                padding: EdgeInsets.only(left: 16, right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CupertinoTextField(
                          minLines: 1,
                          maxLines: 5,
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    CupertinoButton(
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Icon(CupertinoIcons.arrowtriangle_right_fill),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: navigator(context: context),
      child: body(),
    );
  }
}
