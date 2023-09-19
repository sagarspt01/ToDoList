import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List list_to_Do = [];
  //reference the box
  final _mybox = Hive.box("mybox");

  // 1st time opening the app
  void createInitialData() {
    list_to_Do = [
      ["Make a app", false],
      ["Drink water", false]
    ];
  }

  // load the database
  void loadData() {
    list_to_Do = _mybox.get("TODOLIST");
  }

  // update database
  void updateDataBase() {
    _mybox.put("TODOLIST", list_to_Do);
  }
}
