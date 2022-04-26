import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/helper/database_provider.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/style_constents.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';
import 'package:tasker/core/widget/day_list.dart';
import 'package:tasker/core/widget/tag/tag_list.dart';
import 'package:tasker/core/widget/task/task.dart';

class TaskView extends StatelessWidget
{
  static const String taskViewRoute = '/tasks';

  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) => Scaffold(
            body: Column(
              children: [
                _buildAppBar(context),
                const TagList(),
                const SizedBox(height: 20,),
                Expanded(
                  child: state.isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [for (Task task in state.tasks) TaskWidget(task: task)],
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => {
                Navigator.pushNamed(context, AddTaskView.addTaskViewRoute),
                //context.read<TaskCubit>().addTask()
              }
            ),
          ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context)
  {
    return Padding(
      padding: const AppBarPadding.all(),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)
          )
        ],
      ),
    );
  }
}
