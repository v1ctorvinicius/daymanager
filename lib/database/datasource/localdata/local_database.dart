import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabase {
  List todoList = [];

  final hiveBox = Hive.box('daymanager');

  void createDatabase() {
    todoList = [
      ["Practice guitar", true],
      ["Buy milk", false],
    ];
  }

  void getAllCheckbox() {
    todoList = hiveBox.get('TODOLIST');
  }

  void saveCheckbox() {
    hiveBox.put("TODOLIST", todoList);
  }
}
