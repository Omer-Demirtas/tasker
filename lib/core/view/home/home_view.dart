import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/view/Task/task_view.dart';
import 'package:tasker/core/view/settings/settings_view.dart';
import 'package:tasker/core/widget/section_title.dart';

class HomeView extends StatelessWidget
{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.menu),
                      IconButton(
                          onPressed: () => Navigator.pushNamed(context,
                            SettingsView.settingsRoute
                          )
                          , icon: const Icon(Icons.settings)
                      ),
                    ],
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    print(DateTime.now().day);
                    //context.read<TaskCubit>().deleteAll();
                    DateTime now = new DateTime.now();
                    DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);
                  },
                  child: Text('delete all task')
              ),
              const SectionTitle(),
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) => ListView(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context.read<TaskCubit>().getAll();
                                Navigator.pushNamed(context, TaskView.taskViewRoute);
                              },
                              child: const Text('Go to tasks')
                          ),
                        ],
                      ),

                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTask(Task task, BuildContext context)
  {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      elevation: 30,
      child: ListTile(
        onTap: (){},
        title: Text('${task.title}'),
        subtitle: Text('${task.description}'),
      ),
    );
  }
}
