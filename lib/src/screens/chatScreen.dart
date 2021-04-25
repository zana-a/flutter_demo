import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              child: CupertinoSearchTextField(),
            ),
            trailing: navbarButton(
              child: Icon(CupertinoIcons.plus_app),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.light
                      ? CupertinoColors.white
                      : CupertinoColors.darkBackgroundGray,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: navbarButton(
                            child: Icon(CupertinoIcons.archivebox),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: navbarButton(
                            child: Text('New Group'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: CupertinoColors.systemGrey2,
                  height: 1,
                ),
                // MessageTileMaterial(),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MessageTile();
              },
              childCount: 1,
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

class MessageTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CupertinoColors.white,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: CupertinoColors.systemGrey6,
        onTap: () {},
        child: Dismissible(
          key: Key('a'),
          direction: DismissDirection.endToStart,
          background: Container(
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
          ),
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
                          Material(
                            shape: CircleBorder(),
                            clipBehavior: Clip.hardEdge,
                            color: CupertinoColors.systemGrey5,
                            child: Ink.image(
                              image: NetworkImage('https://picsum.photos/240'),
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                              child: InkWell(
                                onTap: () {},
                              ),
                            ),
                          ),
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
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'John Appleseed',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: CupertinoColors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Text(
                                    'Yesterday',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: CupertinoColors.secondaryLabel,
                                    ),
                                  ),
                                ),
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
                                  child: RichText(
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
                                          text:
                                              'Hello, World, I am Zana and I like to write things that are not that meaningful' +
                                                  '\n',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.systemGrey5,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                      top: 4,
                                      bottom: 4,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '1',
                                        style: TextStyle(
                                          color: CupertinoColors.secondaryLabel,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
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
