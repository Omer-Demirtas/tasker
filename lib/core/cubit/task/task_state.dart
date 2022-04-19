part of 'task_cubit.dart';

@immutable
class TaskState
{
  final List<Task> tasks;
  final bool isLoading;

  const TaskState({required this.tasks, required this.isLoading});
}