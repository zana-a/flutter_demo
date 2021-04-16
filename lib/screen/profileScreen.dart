import 'package:flutter/cupertino.dart';

class ProfileScreen extends StatelessWidget {
  final String name;

  ProfileScreen({this.name});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
      ),
      child: Text(''),
    );
  }
}
