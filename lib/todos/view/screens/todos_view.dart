import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todos/provider/todos_provider.dart';
import 'package:todo_app/todos/view/widgets/add_todo_widget.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Todos App",
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: Consumer<TodosProvider>(
        builder: (BuildContext context, TodosProvider todosProvider,
                Widget? child) =>
            SafeArea(
          child: todosProvider.todos.isNotEmpty
              ? ListView.builder(
                  itemCount: todosProvider.todos.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text(
                              todosProvider.todos[index].id,
                              style: TextStyle(
                                color: todosProvider.todos[index].isCompleted
                                    ? Colors.grey[600]
                                    : Colors.black,
                              ),
                            )),
                            title: Text(
                              todosProvider.todos[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: todosProvider.todos[index].isCompleted
                                      ? Colors.grey[600]
                                      : Colors.black,
                                  decoration:
                                      todosProvider.todos[index].isCompleted
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                  decorationColor: Colors.grey[600]),
                            ),
                            subtitle: Text(
                              todosProvider.todos[index].description,
                              style: TextStyle(
                                color: todosProvider.todos[index].isCompleted
                                    ? Colors.grey[600]
                                    : Colors.black,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    todosProvider.completeTodo(index);
                                  },
                                  child: Icon(
                                    todosProvider.todos[index].isCompleted
                                        ? Icons.check_circle_outline_outlined
                                        : Icons.circle_outlined,
                                    color:
                                        todosProvider.todos[index].isCompleted
                                            ? Colors.grey[600]
                                            : Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    todosProvider
                                        .removeTodo(todosProvider.todos[index]);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )))
              : const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("No Todos"),
                    )
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            AddTodoDialog().showAddTodoDialog(context);
          }),
    );
  }
}
