import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
  final int counts;

  MessageTile({
    @required this.key,
    @required this.name,
    @required this.message,
    @required this.date,
    @required this.presence,
    @required this.messageStatus,
    @required this.profileImage,
    @required this.counts,
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
        width: 54,
        height: 54,
        child: InkWell(
          onTap: () {},
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 64,
                        backgroundImage: profileImage,
                      ),
                      Text(this.name)
                    ],
                  ),
                );
              },
            );
          },
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
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget profileDate() {
    return Expanded(
      flex: 0,
      child: Text(
        DateFormat.EEEE().format(this.date).substring(0, 3),
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
    return this.counts > 0
        ? Container(
            alignment: Alignment.center,
            child: Text(
              this.counts.toString(),
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 12,
              ),
            ),
          )
        : null;
  }

  Widget profileMessage() {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
        ),
        children: [
          WidgetSpan(
            child: Padding(
              padding: EdgeInsets.only(
                // right: 2,
                right: 0,
              ),
              child: Icon(
                Icons.done_all_rounded,
                // size: 18,
                size: 0,
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
        onTap: () {
          return Navigator.push(context, CupertinoPageRoute(builder: (context) {
            return MessagesPage();
          }));
        },
        onLongPress: () {
          //   showCupertinoModalPopup(
          //     context: context,
          //     builder: (BuildContext context) => CupertinoActionSheet(
          //       title: Column(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           SizedBox(
          //             width: 64,
          //             height: 64,
          //             child: CircleAvatar(
          //               backgroundColor: Colors.transparent,
          //               child: ClipOval(
          //                 child: Image(
          //                   image: this.profileImage,
          //                 ),
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 16,
          //           ),
          //           Text(
          //             this.name,
          //             style: TextStyle(
          //               fontSize: 16,
          //             ),
          //           ),
          //         ],
          //       ),
          //       message: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           CupertinoButton(
          //             onPressed: () {},
          //             padding: EdgeInsets.zero,
          //             child: Icon(CupertinoIcons.phone),
          //           ),
          //           CupertinoButton(
          //             onPressed: () {},
          //             padding: EdgeInsets.zero,
          //             child: Icon(CupertinoIcons.chat_bubble),
          //           ),
          //         ],
          //       ),
          //       actions: [
          //         CupertinoActionSheetAction(
          //           onPressed: () {},
          //           child: Text(
          //             'Archive',
          //           ),
          //         ),
          //         CupertinoActionSheetAction(
          //           onPressed: () {},
          //           child: Text(
          //             'Delete',
          //             style: TextStyle(color: CupertinoColors.destructiveRed),
          //           ),
          //         ),
          //         CupertinoActionSheetAction(
          //           child: Text('View Profile'),
          //           onPressed: () {
          //             Navigator.pop(context);
          //             Navigator.push(
          //               context,
          //               CupertinoPageRoute(builder: (BuildContext context) {
          //                 return CupertinoPageScaffold(child: Text('Replace me'));
          //               }),
          //             );
          //           },
          //         )
          //       ],
          //     ),
          //   );
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
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          profile(context: context),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: CupertinoColors.white,
                            child: CircleAvatar(
                              radius: 6,
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
                                this.counts > 0
                                    ? Expanded(
                                        flex: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.activeGreen,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          padding: EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 4,
                                            bottom: 4,
                                          ),
                                          child: counter(),
                                        ),
                                      )
                                    : Container(
                                        width: double.minPositive,
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
              // Divider(
              //   height: 1,
              //   // indent: 74,
              //   color: Colors.grey[300],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        padding: EdgeInsetsDirectional.only(start: 8, end: 8),
        automaticallyImplyLeading: false,
        automaticallyImplyMiddle: false,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: double.minPositive,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.back),
        ),
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CupertinoButton(
            //   padding: EdgeInsets.zero,
            //   minSize: double.minPositive,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            //   child: Icon(CupertinoIcons.back),
            // ),
            Container(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Zana',
                    style: TextStyle(
                      height: 1,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Last Seen 2pm',
                    style: TextStyle(
                      height: 1,
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: double.minPositive,
          onPressed: () {},
          child: Icon(CupertinoIcons.phone),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          return FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/760/1200"),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
              padding: EdgeInsetsDirectional.only(
                end: MediaQuery.of(context).size.width / 4,
              ),
              itemBuilder: (context, index) {
                return Wrap(
                  children: [
                    Bubble(
                      showNip: true,
                      nip: BubbleNip.leftTop,
                      nipWidth: 4,
                      margin: BubbleEdges.only(bottom: 6),
                      style: BubbleStyle(
                        borderWidth: 0.5,
                        borderColor: Colors.grey[200],
                      ),
                      padding: BubbleEdges.only(
                        left: 8,
                        right: 8,
                        bottom: 2,
                        top: 6,
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6),
                            child: Text(
                              'Hi. It is nice to meet you.'.trim(),
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 0,
                              bottom: 2,
                              right: 0,
                              left: 6,
                            ),
                            child: Text(
                              DateFormat.jm().format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500],
                                height: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              itemCount: 1,
            ),
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//     padding: EdgeInsets.only(bottom: 56),
//     itemBuilder: (context, index) {
//       return Wrap(
//         children: [
//           Bubble(
//             showNip: true,
//             nip: BubbleNip.leftTop,
//             nipWidth: 4,
//             margin: BubbleEdges.only(bottom: 4),
//             style: BubbleStyle(
//               borderWidth: 0.5,
//               borderColor: Colors.grey[200],
//             ),
//             child: Text('Hello'),
//           ),
//         ],
//       );
//     },
//     itemCount: 100,
//   ),
//   Container(
//     decoration: BoxDecoration(
//       color: Colors.white,
//       border: Border(
//         top: BorderSide(
//           width: 1,
//           color: Colors.grey[300],
//         ),
//       ),
//     ),
//     padding: EdgeInsets.all(8),
//     child: CupertinoTextField(
//       maxLines: 4,
//       minLines: 1,
//     ),
//   ),
// ],
