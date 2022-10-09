part of 'task_cubit.dart';

@immutable
class TaskState
{
  final List<Task>? tasks;
  final bool? isLoading;
  final DateTime date;

  const TaskState({
    this.isLoading = false,
    this.tasks,
    required this.date
  });

  TaskState copyWith({
    bool? isLoading,
    List<Task>? tasks,
    DateTime? date
  }) {
    return TaskState(
      isLoading: isLoading ?? false,
      tasks: tasks ?? this.tasks,
      date: date ?? this.date,
    );
  }
}