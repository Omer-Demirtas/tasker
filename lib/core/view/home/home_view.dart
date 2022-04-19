import 'package:flutter/material.dart';
import 'package:tasker/core/view/add_task/add_task_view.dart';

class HomeView extends StatelessWidget
{
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('asd'),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(
                context,
                AddTaskView.addTaskViewRoute,
                arguments: 'ASD'
              );
            },
                child: Text('go to add task')
            )
          ],
        ),
      ),
    );
  }
}
