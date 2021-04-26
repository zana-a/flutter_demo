import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String title;

  SettingsScreen({this.title});

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
            stretch: true,
            largeTitle: Text(this.title),
          )
        ],
      ),
    );
  }
}
