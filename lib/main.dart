import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(title: const Text('Day manager')),
            body: Container(
                color: Colors.white,
                child: const Center(
                    child:
                        Text('Day Manager', style: TextStyle(fontSize: 50)))),
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
