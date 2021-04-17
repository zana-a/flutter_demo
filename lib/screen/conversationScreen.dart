import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/messages.dart';
import 'package:flutter_app/screen/profileScreen.dart';
import 'package:flutter_app/widgets/conversationBubble.dart';

class ConversationScreen extends StatelessWidget {
  final String name;
  final bool isTyping;

  ConversationScreen({this.name, this.isTyping = false});

  Widget navigator({context: BuildContext}) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white,
      trailing: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Expanded(
              child: isTyping
                  ? Text(
                      'is typing ...',
                      style: TextStyle(
                        color: CupertinoColors.link,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Text(
                        this.name,
                        style: TextStyle(
                          color: CupertinoColors.label,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CupertinoButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.phone),
                onPressed: () {},
              ),
              CupertinoButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) {
                    return ProfileScreen(name: this.name);
                  }));
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: CupertinoColors.systemGrey,
                ),
              ),
            ],
          ),
        ],
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
                color: CupertinoColors.white,
                // padding: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          heightFactor: 2.1,
                          child: Icon(CupertinoIcons.plus),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(8, 8),
                            ),
                            border: Border.all(
                              color: CupertinoColors.systemGrey3,
                            ),
                          ),
                          minLines: 1,
                          maxLines: 5,
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 16, right: 8),
                        child: Center(
                          heightFactor: 2.1,
                          child: Icon(CupertinoIcons.camera),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          heightFactor: 2.1,
                          child: Icon(CupertinoIcons.arrowtriangle_right_fill),
                        ),
                      ),
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
