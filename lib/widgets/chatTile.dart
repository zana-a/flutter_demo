import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/conversationScreen.dart';
import 'package:flutter_app/util/Date.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String message;
  final Date date;
  final int counter;

  ChatTile({
    String key,
    this.name,
    this.message,
    this.date,
    this.counter,
  }) : super(key: Key(key));

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      movementDuration: Duration(milliseconds: 650),
      background: Container(
        color: CupertinoColors.systemBlue,
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: Icon(
            CupertinoIcons.archivebox,
            color: CupertinoColors.white,
          ),
        ),
      ),
      key: key,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Material(
            color: Colors.white,
            child: InkWell(
              splashColor: CupertinoColors.lightBackgroundGray,
              highlightColor: CupertinoColors.extraLightBackgroundGray,
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return ConversationScreen(
                    name: this.name,
                  );
                }));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundColor: CupertinoColors.lightBackgroundGray,
                          radius: 28,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            this.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.label,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Text(
                              this.message,
                              maxLines: 2,
                              style: TextStyle(
                                color: CupertinoColors.label,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: Text(
                        this.date.date,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            indent: 82,
            height: 0,
            color: CupertinoColors.systemGrey2,
          )
        ],
      ),
    );
  }
}
