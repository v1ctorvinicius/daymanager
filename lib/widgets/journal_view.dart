import 'package:daymanager/database/datasource/localdata/local_database.dart';
import 'package:daymanager/widgets/components/checkbox_component.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _MyAppState();
}

class _MyAppState extends State<JournalView> {
  final hiveBox = Hive.box('daymanager');
  final LocalDatabase localDatabase = LocalDatabase();

  List<Widget> todoList = [];

  final TextEditingController _addTaskDescriptionController =
      TextEditingController();

  @override
  void initState() {
    if (hiveBox.get("TODOLIST") == null) {
      localDatabase.createDatabase();
    } else {
      localDatabase.getAllCheckbox();
    }

    super.initState();
    setState(() {
      todoList = localDatabase.todoList
          .map((task) => CheckboxComponent(
                title: task[0],
                value: task[1],
              ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 242, 134),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: todoList),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            openDialog();
          },
        ));
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
              title: const Text('Adicionar'),
              content: TextField(
                  decoration: const InputDecoration(hintText: "Descrição"),
                  autofocus: true,
                  controller: _addTaskDescriptionController),
              actions: [
                TextButton(
                    child: const Text("Adicionar"),
                    onPressed: () {
                      setState(() {
                        todoList.add(CheckboxComponent(
                          title: _addTaskDescriptionController.text,
                          value: false,
                        ));
                        _addTaskDescriptionController.clear();
                        Navigator.of(context).pop();
                      });
                    })
              ]));
}
