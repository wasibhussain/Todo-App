import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todos/model/todos_model.dart';
import 'package:todo_app/todos/provider/todos_provider.dart';

class AddTodoDialog {
  Future<void> showAddTodoDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return showDialog(
        context: (context),
        builder: (_) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    const Text("Add Todo",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            label:
                                Text("Title", style: TextStyle(fontSize: 12)),
                            border: OutlineInputBorder())),
                    const SizedBox(height: 10),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          label: Text("Description",
                              style: TextStyle(fontSize: 12)),
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () {
                          if ((titleController.text.isEmpty ||
                              descriptionController.text.isEmpty)) return;
                          Random random = Random();
                          int randomNumber = random.nextInt(100);
                          final todoProvider = Provider.of<TodosProvider>(
                              context,
                              listen: false);
                          todoProvider.addTodo(TodosModel(
                              id: randomNumber.toString(),
                              title: titleController.text,
                              description: descriptionController.text,
                              isCompleted: false));
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add"))
                  ],
                ),
              ),
            ));
  }
}
