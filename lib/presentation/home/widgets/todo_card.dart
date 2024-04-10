import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meetup_app/domain/home/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(
    this.todo, {
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(blurRadius: 1, color: Colors.black.withOpacity(0.2)),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.primaries[todo.userId],
                    child: const Icon(
                      Icons.adb,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(child: Text(todo.title)),
                ],
              ),
            ),
            Text(
              todo.completed ? "✅" : "◻️",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
