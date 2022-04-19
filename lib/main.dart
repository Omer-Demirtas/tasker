import 'package:flutter/material.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';
import 'package:tasker/core/view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple.shade200,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.purple.shade200,
            secondary: Colors.pink.shade200
        ),
      ),
      routes: {
        AddTaskView.addTaskViewRoute: (context) => const AddTaskView()
      },
      // Provide a function to handle named routes.
      // Use this function to identify the named
      // route being pushed, and create the correct
      // Screen.
      onGenerateRoute: (settings) {
        if (settings.name == AddTaskView.addTaskViewRoute) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => const AddTaskView()
          );
        }

        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with Arguments',
      home: const HomeView(),
    );
  }
}
