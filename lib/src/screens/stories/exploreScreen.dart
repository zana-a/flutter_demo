import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  final String title;

  ExploreScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor:
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? CupertinoColors.white
              : CupertinoColors.darkBackgroundGray,
      navigationBar: CupertinoNavigationBar(
        middle: Text(this.title),
      ),
      child: Text('hello'),
    );
  }
}
