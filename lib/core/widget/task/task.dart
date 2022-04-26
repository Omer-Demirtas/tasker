import 'package:flutter/material.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/utils/date_time_utils.dart';

class TaskWidget extends StatelessWidget
{
  final Task task;

  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(task.title!, style: const TextStyle(fontSize: 18),),
                (task.cyclical != null && task.cyclical == true) ? const Icon(Icons.loop) : const SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text(task.description!),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Chip(label: Text('school')),
                    SizedBox(width: 10,),
                    Chip(label: Text('Shopping'))
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
    );
  }
}
