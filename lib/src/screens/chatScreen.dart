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
    return Dismissible(
      key: Key('a'),
      direction: DismissDirection.endToStart,
      background: Container(
        color: CupertinoColors.activeBlue,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zana',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 2,
                                    ),
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 18,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'By Michaelas kdjals jdlajasldjl alksdjlk asjdlj alsjdlkaj sljdlj\n',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('today'),
                        CircleAvatar(
                          backgroundColor: CupertinoColors.activeGreen,
                          radius: 10,
                          child: Text(
                            '1',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            indent: 74,
          )
        ],
      ),
    );
  }
}

class MessageTileMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: Key('a'),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
            ),
            trailing: Text('Today'),
            onTap: () {},
            title: Text('Zana'),
            subtitle: Text(
              'Hello, World. I am Zana and I like to program things. What do you think? ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
