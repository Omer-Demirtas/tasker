import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/core/model/task.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(tasks: [], isLoading: false));


  void addTask() async
  {
    emit(TaskState(isLoading: true, tasks: state.tasks));
    await Future.delayed(const Duration(seconds: 1));

    List<Task> tasks = state.tasks.toList();
    tasks.add(Task(title: 'New Task', startAt: DateTime.now(), finishAt: DateTime.now(), description: 'asd', id: 1));

    emit(TaskState(isLoading: false, tasks: tasks));
  }
}
