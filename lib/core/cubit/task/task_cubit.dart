import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/service/task_service.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>
{
  final TaskRepository taskRepository;

  TaskCubit({required this.taskRepository, required int day}) : super(
      TaskState(
          tasks: [],
          isLoading: false,
          day: day
      )
  );

  void addTask(Task task) async
  {
    emit(state.copyWith(isLoading: true));

    await taskRepository.add(task);

    List<Task> tasks = state.tasks!.toList();
    tasks.add(task);

    emit(state.copyWith(isLoading: false, tasks: tasks));
  }

  Future<void> getAll() async
  {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));

    List<Task> tasks = await taskRepository.getAll();

    emit(state.copyWith(tasks: tasks, isLoading: false));
  }

  Future<void> delete(int id) async
  {
    taskRepository.delete(id);
  }

  Future<void> deleteAll() async
  {
    return await taskRepository.deleteAll();
  }

  updateDay(int day) async
  {
    emit(state.copyWith(day: day, isLoading: true));
    DateTime date = DateTime(DateTime.now().year, DateTime.now().month, day);
    List<Task> tasks = await taskRepository.getByDate(date);
    emit(state.copyWith(tasks: tasks));
  }
}
