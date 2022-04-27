import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/Theme/theme_cubit.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/service/task_service.dart';
import 'package:tasker/core/view/Task/task_view.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';
import 'package:tasker/core/view/home/home_view.dart';
import 'package:tasker/core/view/settings/settings_view.dart';

void main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) => MaterialApp(
        theme: theme,
        routes: {
          AddTaskView.addTaskViewRoute: (context) => const AddTaskView(),
          TaskView.taskViewRoute: (context) => const TaskView(),
          SettingsView.settingsRoute: (context) => const SettingsView()
        },
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
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:  [
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          ),
          BlocProvider<TaskCubit>(
            create: (context) => TaskCubit(taskRepository: TaskDBService())
          ),
        ],
        child: const MyApp(),
    );
  }
}
