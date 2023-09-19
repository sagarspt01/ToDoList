import 'package:flutter/material.dart';
import 'package:task_to_do/utility/mybuttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Colors.deepPurple[100],
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Enter your task"),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Mybuttom(
                  name: "save",
                  onPressed: onSave,
                ),
                Mybuttom(
                  name: "cancle",
                  onPressed: onCancle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
