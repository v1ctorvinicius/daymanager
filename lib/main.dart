import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'widgets/purse_view.dart';
import 'widgets/journal_view.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('daymanager');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indexBottomNav = 1;

  static const List<Widget> views = <Widget>[
    PurseView(),
    JournalView(),
    Text('Inventory View', style: TextStyle(fontSize: 50))
  ];

  static const List<Widget> drawerOptions = <Widget>[
    Text('Map'),
    Text('Settings')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: Scaffold(
            backgroundColor: Colors.yellow,
            drawer: Drawer(child: ListView(children: drawerOptions)),
            appBar: AppBar(
              title: const Text('Day manager'),
              elevation: 0,
            ),
            body:
                Container(color: Colors.white, child: views[indexBottomNav]),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: indexBottomNav,
              onTap: (index) {
                setState(() {
                  indexBottomNav = index;
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
