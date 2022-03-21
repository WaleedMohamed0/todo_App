import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/add_task.dart';
import 'package:todo/task_provider.dart';
import 'package:todo/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
     create: (context) => TaskProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'jannah',
        ),
        home: TasksScreen(),
      ),
    );
  }
}
