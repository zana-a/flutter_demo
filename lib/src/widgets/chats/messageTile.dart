import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/widgets/chats/tile/presence.dart';
import 'package:flutter_app/src/widgets/chats/tile/status.dart';
import 'package:intl/intl.dart';

class MessageTile extends StatelessWidget {
  final Key key;
  final String name;
  final String message;
  final DateTime date;
  final Presence presence;
  final Status messageStatus;
  final ImageProvider profileImage;

  MessageTile({
    @required this.key,
    @required this.name,
    @required this.message,
    @required this.date,
    @required this.presence,
    @required this.messageStatus,
    @required this.profileImage,
  });

  Widget dismissibleBackground() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      alignment: Alignment.centerRight,
      color: CupertinoColors.activeBlue,
      child: CircleAvatar(
        backgroundColor: Colors.blue.shade800,
        child: Icon(
          CupertinoIcons.archivebox,
          color: CupertinoColors.white,
        ),
      ),
    );
  }

  Widget profile({@required BuildContext context}) {
    return Material(
      shape: CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: CupertinoColors.systemGrey5,
      child: Ink.image(
        image: this.profileImage,
        fit: BoxFit.cover,
        width: 48,
        height: 48,
        child: InkWell(
          onTap: () {},
        ),
      ),
    );
  }

  Widget profileName() {
    return Expanded(
      flex: 1,
      child: Text(
        this.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget profileDate() {
    return Expanded(
      flex: 0,
      child: Text(
        DateFormat.EEEE().format(this.date),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14,
          color: CupertinoColors.secondaryLabel,
        ),
      ),
    );
  }

  Widget counter() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        '1',
        style: TextStyle(
          color: CupertinoColors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget profileMessage() {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: CupertinoColors.inactiveGray,
        ),
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(
                right: 2,
              ),
              child: Icon(
                Icons.done_all_rounded,
                size: 18,
              ),
            ),
          ),
          TextSpan(
            text: this.message + '\n',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CupertinoColors.white,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: CupertinoColors.systemGrey6,
        onTap: () {},
        onLongPress: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 64,
                    height: 64,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: Image(
                          image: this.profileImage,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    this.name,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Chat'),
                ),
                CupertinoActionSheetAction(
                  child: Text('View Profile'),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (BuildContext context) {
                        return CupertinoPageScaffold(child: Text('Replace me'));
                      }),
                    );
                  },
                )
              ],
            ),
          );
        },
        child: Dismissible(
          key: this.key,
          movementDuration: Duration(milliseconds: 900),
          resizeDuration: Duration(milliseconds: 200),
          direction: DismissDirection.endToStart,
          background: dismissibleBackground(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          profile(context: context),
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: CupertinoColors.white,
                            child: CircleAvatar(
                              radius: 4,
                              backgroundColor: CupertinoColors.activeGreen,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                profileName(),
                                profileDate(),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: profileMessage(),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.activeGreen,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 4,
                                      bottom: 4,
                                    ),
                                    child: counter(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                indent: 74,
                color: CupertinoColors.opaqueSeparator,
              )
            ],
          ),
        ),
      ),
    );
  }
}
