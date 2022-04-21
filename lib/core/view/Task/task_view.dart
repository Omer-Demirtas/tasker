import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker/core/cubit/task/task_cubit.dart';
import 'package:tasker/core/model/task.dart';

class TaskView extends StatelessWidget
{
  static const String taskViewRoute = '/tasks';

  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<TaskCubit>(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) => Scaffold(
            body: Column(
              children: [
                _buildAppBar(context),
                _buildDays(),
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
              onPressed: () => context.read<TaskCubit>().addTask(),
            ),
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
              SizedBox(height: 10,),
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
  
  Widget _buildDays()
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          for (int i in Iterable<int>.generate(20).toList()) Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Chip(avatar: Icon(Icons.school), label: Text("School"),)
          )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context)
  {
    return Padding(
      padding: EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios)
          )
        ],
      ),
    );
  }
}
