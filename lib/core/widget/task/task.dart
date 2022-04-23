import 'package:flutter/material.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/date_time_utils.dart';

class TaskWidget extends StatelessWidget
{
  final Task task;

  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task.title!, style: TextStyle(fontSize: 18),),
                      const SizedBox(height: 10,),
                      Text(task.description!),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        DateTimeConverter.convertDateTimeToString(task.date!)
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Chip(avatar: Icon(Icons.school), label: Text('school')),
                      SizedBox(width: 10,),
                      Chip(avatar: Icon(Icons.shopping_cart) , label: Text('Shopping'))
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${DateTimeConverter.convertTimeToString(task.startAt!)} - ${DateTimeConverter.convertTimeToString(task.finishAt!)}',
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
