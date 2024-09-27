import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todos/provider/todos_provider.dart';
import 'package:todo_app/todos/view/screens/todos_view.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TodosProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "Poppins"),
      home: const TodosView(),
    );
  }
}
