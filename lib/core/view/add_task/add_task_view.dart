import 'package:flutter/material.dart';
import 'package:tasker/core/view/add_task/add_task_form.dart';
import 'package:tasker/core/widget/tag/tag_list.dart';

class AddTaskView extends StatelessWidget
{
  static const String addTaskViewRoute = '/addTaskView';

  const AddTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildAppBar(context),
            const AddTaskForm()
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
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
