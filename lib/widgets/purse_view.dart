import 'package:flutter/material.dart';

class PurseView extends StatefulWidget {
  const PurseView({super.key});

  @override
  State<PurseView> createState() => _MyAppState();
}

class _MyAppState extends State<PurseView> {
  int _indexBottomNav = 1;

  static const List<Widget> _views = <Widget>[];
  static const List<Widget> _drawerOptions = <Widget>[
    Text('Map'),
    Text('Settings')
  ];

  @override
  Widget build(BuildContext context) {
    return const Text('Purse View', style: TextStyle(fontSize: 50));
  }
}
