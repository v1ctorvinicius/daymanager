import 'package:daymanager/widgets/components/checkbox_component.dart';
import 'package:flutter/material.dart';

class JournalView extends StatefulWidget {
  const JournalView({super.key});

  @override
  State<JournalView> createState() => _MyAppState();
}

class _MyAppState extends State<JournalView> {
  final TextEditingController _addTaskDescriptionController =
      TextEditingController();

  List<Widget> _tasks = [];

  List<bool> _tasksValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 254, 242, 134),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: _tasks),
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
                        _tasksValues.add(false);
                        _tasks.add(CheckboxComponent(
                          title: _addTaskDescriptionController.text,
                          value: false,
                        ));
                        _addTaskDescriptionController.clear();
                        Navigator.of(context).pop();
                      });
                    })
              ]));
}
