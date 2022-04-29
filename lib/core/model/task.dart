import 'package:flutter/material.dart';
import 'package:tasker/core/model/tag.dart';
import 'package:tasker/core/utils/date_time_utils.dart';

class Task {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? startAt;
  final DateTime? finishAt;
  final List<Tag>? tags;
  final bool? cyclical;
  final String? cron;

  const Task({
    this.id,
    this.title,
    this.description,
    this.startAt,
    this.finishAt,
    this.tags,
    this.cyclical,
    this.cron
  });

  factory Task.fromMap(Map<String, dynamic> map)
  {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      startAt: DateTime.fromMillisecondsSinceEpoch(map['start_at']),
      finishAt: DateTime.fromMillisecondsSinceEpoch(map['finish_at']),
      cron: map['cron'],
      cyclical: map['is_cyclical'] == 1 ? true : false,
    );
  }


  static Map<String, Object?> toMap(Task task) {
    return {
      'title': task.title,
      'description': task.description,
      'start_at': task.startAt?.millisecondsSinceEpoch,
      'finish_at': task.finishAt?.millisecondsSinceEpoch,
      'is_cyclical': task.cyclical == true ? 1 : 0, //task.cyclical,
      'cron': 'asd', //task.cron
    };
  }

}