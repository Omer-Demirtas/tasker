import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';
import 'package:tasker/core/widget/section_title.dart';

class HomeView extends StatelessWidget
{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.menu),
                    ],
                  )
              ),
              SectionTitle(),
              Expanded(
                  child: SizedBox.expand(
                    child: SingleChildScrollView(
                      child: BlocProvider<TaskCubit>(
                        create: (context) => TaskCubit(),
                        child: BlocBuilder<TaskCubit, TaskState>(
                          builder: (context, state) => Column(
                            children: [
                              ElevatedButton(onPressed: () => context.read<TaskCubit>().addTask(),
                                  child: const Text('create new task')
                              ),
                              for (Task task in state.tasks) _buildTask(task, context)
                            ],
                          ),
                        ),
                      )
                    ),
                  )
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
