import 'package:flutter/material.dart';
import 'package:tasker/core/model/tag.dart';

class Task {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? date;
  final TimeOfDay? startAt;
  final TimeOfDay? finishAt;
  final List<Tag>? tags;
  final bool? cyclical;

  const Task({
    this.id,
    this.title,
    this.description,
    this.date,
    this.startAt,
    this.finishAt,
    this.tags,
    this.cyclical
  });
}