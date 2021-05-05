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
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? CupertinoColors.white
              : CupertinoColors.darkBackgroundGray,
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            middle: Text(this.title),
            stretch: true,
            backgroundColor:
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? null
                    : CupertinoColors.darkBackgroundGray,
            leading: navbarButton(
              child: Text('Edit'),
            ),
            largeTitle: Container(
              padding: EdgeInsets.only(
                right: 16,
                top: 16,
              ),
              // child: CupertinoSearchTextField(),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: navbarButton(
                      child: Container(
                        padding: EdgeInsets.only(right: 8),
                        alignment: Alignment.centerLeft,
                        child: navbarButton(
                          child: Icon(CupertinoIcons.archivebox),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: navbarButton(
                  //     child: Container(
                  //       alignment: Alignment.centerRight,
                  //       child: navbarButton(
                  //         child: Icon(CupertinoIcons.archivebox),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    flex: 1,
                    child: CupertinoSearchTextField(),
                  ),
                ],
              ),
            ),
            trailing: navbarButton(
              child: Icon(CupertinoIcons.square_pencil),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                // Container(
                //   color: MediaQuery.of(context).platformBrightness ==
                //           Brightness.light
                //       ? CupertinoColors.white
                //       : CupertinoColors.darkBackgroundGray,
                //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 1,
                //         child: Container(
                //           alignment: Alignment.topLeft,
                //           child: navbarButton(
                //             child: Icon(CupertinoIcons.archivebox),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         flex: 1,
                //         child: Container(
                //           alignment: Alignment.topRight,
                //           child: navbarButton(
                //             child: Text('New Group'),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(
                //   color: CupertinoColors.systemGrey2,
                //   height: 1,
                // ),
                // MessageTileMaterial(),
              ],
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: EdgeInsets.symmetric(vertical: 16),
          //     height: 78,
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 10,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Container(
          //           margin: index == 0
          //               ? EdgeInsets.only(left: 16, right: 8)
          //               : EdgeInsets.symmetric(horizontal: 8),
          //           width: 78,
          //           child: Material(
          //             shape: CircleBorder(),
          //             clipBehavior: Clip.hardEdge,
          //             color: CupertinoColors.systemGrey5,
          //             child: Ink.image(
          //               image: NetworkImage('https://picsum.photos/128'),
          //               fit: BoxFit.cover,
          //               width: 48,
          //               height: 48,
          //               child: InkWell(
          //                 onTap: () {},
          //               ),
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildListDelegate([
          //     Divider(
          //       color: CupertinoColors.systemGrey2,
          //       height: 1,
          //     ),
          //   ]),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MessageTile(
                  key: Key(''),
                  name: 'Zana Ahmad',
                  message: 'Hello, World!',
                  date: DateTime.parse('2021-04-26 20:21:00.201'),
                  presence: Presence.Online,
                  profileImage: NetworkImage('https://picsum.photos/64'),
                  messageStatus: Status.Seen,
                );
              },
              childCount: 10,
            ),
          ),
        ],
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
