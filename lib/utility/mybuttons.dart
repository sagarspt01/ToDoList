import 'package:flutter/material.dart';

class Mybuttom extends StatelessWidget {
  String name;
  VoidCallback onPressed;
  Mybuttom({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(name),
      // color: Colors.deepPurple[300],
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
