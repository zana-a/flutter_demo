import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNavigationBar(
          backgroundColor: CupertinoColors.white,
          largeTitle: Text('Settings'),
          stretch: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Material(
                child: ListTile(
                  title: Text('name'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}