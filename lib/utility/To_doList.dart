import 'package:flutter/material.dart';

class ToDoTiles extends StatefulWidget {
  String taskName;
  bool taskCompleted;
  Function(bool?)? onchanged; // without ? gives error
  Function()? dltFunction;
  ToDoTiles(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onchanged,
      required this.dltFunction});

  @override
  State<ToDoTiles> createState() => _ToDoTilesState();
}

class _ToDoTilesState extends State<ToDoTiles> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            // color: Colors.deepPurple[300],
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  value: widget.taskCompleted,
                  onChanged: widget.onchanged,
                  checkColor: Colors.white,
                ),
                Text(
                  widget.taskName,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: (widget.taskCompleted)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
            FloatingActionButton(
              onPressed: widget.dltFunction,
              child: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.secondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            )
          ],
        ),
      ),
    );
  }
}
