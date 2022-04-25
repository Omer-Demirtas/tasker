import 'package:flutter/material.dart';
import 'package:tasker/core/model/tag.dart';
import 'package:tasker/core/utils/date_time_utils.dart';

class Task {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final TimeOfDay? startAt;
  final TimeOfDay? finishAt;
  final List<Tag>? tags;
  final bool? cyclical;
  final String? cron;

  const Task({
    this.id,
    this.title,
    this.description,
    this.date,
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
      startAt: DateTimeConverter.convertStringToTime(map['start_at']),
      finishAt: DateTimeConverter.convertStringToTime(map['finish_at']),
      cron: map['cron'],
      cyclical: map['cyclical'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }


  static Map<String, Object?> toMap(Task task) {
    return {
      'title': task.title,
      'description': task.description,
      'date': task.date?.millisecondsSinceEpoch,
      'start_at': DateTimeConverter.convertTimeToJustString(task.startAt!),
      'finish_at': DateTimeConverter.convertTimeToJustString(task.finishAt!),
      'is_cyclical': 1, //task.cyclical,
      'cron': 'asd', //task.cron
    };
  }

}