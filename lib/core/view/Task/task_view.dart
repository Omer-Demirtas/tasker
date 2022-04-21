import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/tag.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/tags.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';
import 'package:tasker/core/widget/tag/tag_list.dart';

class TaskView extends StatelessWidget
{
  static const String taskViewRoute = '/tasks';

  const TaskView({Key? key}) : super(key: key);

  void example()
  {
    print('ASD');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) => Scaffold(
            body: Column(
              children: [
                _buildAppBar(context),
                TagList(voidCallback: example,),
                const SizedBox(height: 20,),
                Expanded(
                    child: state.isLoading ? const Center(
                        child: CircularProgressIndicator(),
                      ) :
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [for (Task i in state.tasks) _buildTask()],
                      ),
                  )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => {
                Navigator.pushNamed(context, AddTaskView.addTaskViewRoute),
                //context.read<TaskCubit>().addTask()
              }
            ),
          ),
      ),
    );
  }

  Widget _buildTask()
  {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Task title', style: TextStyle(fontSize: 18),),
                      SizedBox(height: 10,),
                      Text('Lorem ipsum, Lorem ipsum'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.add)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                children: const [
                  Chip(avatar: Icon(Icons.school), label: Text('school')),
                  SizedBox(width: 10,),
                  Chip(avatar: Icon(Icons.shopping_cart) , label: Text('Shopping'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
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
