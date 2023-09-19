import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_to_do/datahive/database.dart';
import 'package:task_to_do/utility/To_doList.dart';
import 'package:task_to_do/utility/dialogbox.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // import my box
  final _mybox = Hive.box("mybox");
  // text controller
  final _controller = TextEditingController();

  // List list_To_Do = [
  //   ["make a app", false],
  //   ["Go home", false]
  // ];
  // look at init stage

  @override
  void initState() {
    // 1st time open the app create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //make a instance of class ToDoDataBase
  ToDoDataBase db = ToDoDataBase();

  // void checkBoxChanged(bool? value, int index) {
  //   setState(() {
  //     list_To_Do[index][1] = value;
  //   });
  // }
  void saveNewTask() {
    setState(() {
      db.list_to_Do.add([_controller.text, false]); // db. added
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancle: () => Navigator.of(context).pop(),
          );
        });
  }

  void dltTask(int index) {
    setState(() {
      db.list_to_Do.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.deepPurple[100],
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          // backgroundColor: Colors.deepPurple[300],
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(
              child: Text(
            "List",
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.secondary,
          ),
          // backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        body: ListView.builder(
            itemCount: db.list_to_Do.length,
            itemBuilder: (context, index) {
              return ToDoTiles(
                taskName: db.list_to_Do[index][0],
                taskCompleted: db.list_to_Do[index][1],
                // onchanged: (value) => checkBoxChanged,
                onchanged: (value) {
                  setState(() {
                    db.list_to_Do[index][1] = value;
                  });
                  db.updateDataBase();
                },
                // dltFunction: dltTask,
                dltFunction: () => dltTask(index), // ?? what happen
              );
            }));
  }
}
