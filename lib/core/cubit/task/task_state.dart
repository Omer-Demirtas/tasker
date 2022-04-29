part of 'task_cubit.dart';

@immutable
class TaskState
{
  final List<Task>? tasks;
  final bool? isLoading;
  final int? day;

  const TaskState({
    this.isLoading = false,
    this.tasks,
    this.day = 0
  });

  TaskState copyWith({
    bool? isLoading,
    List<Task>? tasks,
    int? day
  }) {
    return TaskState(
      isLoading: isLoading ?? false,
      tasks: tasks ?? this.tasks,
      day: day ?? this.day,
    );
  }
}