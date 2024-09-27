import 'package:flutter/material.dart';
import 'package:todo_app/todos/model/todos_model.dart';

class TodosProvider with ChangeNotifier {
  final List<TodosModel> todos = <TodosModel>[
    TodosModel(
        id: "1",
        title: "Watch movie",
        description: "Watch any movie of category SCI-FI.",
        isCompleted: true),
    TodosModel(
        id: "2",
        title: "Coding",
        description: "Coding python for 2 hours.",
        isCompleted: false),
    TodosModel(
        id: "3",
        title: "Bike Wash",
        description: "Bike wash after coding from service shop.",
        isCompleted: false),
    TodosModel(
        id: "4",
        title: "Buy Vegitables",
        description: "Buy vegitables for lunch from Imtiaz Markeet",
        isCompleted: true),
    TodosModel(
        id: "5",
        title: "Friends Meetup",
        description: "Meeting with friends on weekend at hyderabad.",
        isCompleted: true),
  ];

  addTodo(TodosModel todo) {
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(TodosModel todo) {
    todos.remove(todo);
    notifyListeners();
  }

  completeTodo(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    notifyListeners();
  }
}
