import 'package:tasker/core/model/tag.dart';

class Task {
  final int? id;
  final String? title;
  final String? description;
  final DateTime? startAt;
  final DateTime? finishAt;
  final List<Tag>? tags;

  const Task({this.id, this.title, this.description, this.startAt, this.finishAt, this.tags});
}