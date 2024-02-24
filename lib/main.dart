import 'package:flutter/material.dart';
import 'widgets/purse_view.dart';
import 'widgets/journal_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _indexBottomNav = 1;

  static const List<Widget> _views = <Widget>[
    PurseView(),
    JournalView(),
    Text('Inventory View', style: TextStyle(fontSize: 50))
  ];

  static const List<Widget> _drawerOptions = <Widget>[
    Text('Map'),
    Text('Settings')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
            backgroundColor: Colors.yellow,
            drawer: Drawer(child: ListView(children: _drawerOptions)),
            appBar: AppBar(
              title: const Text('Day manager'),
              elevation: 0,
            ),
            body:
                Container(color: Colors.white, child: _views[_indexBottomNav]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _indexBottomNav,
              onTap: (index) {
                setState(() {
                  _indexBottomNav = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.attach_money_rounded), label: 'purse'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.book_rounded), label: 'journal'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_rounded), label: 'inventory')
              ],
            )));
  }
}
