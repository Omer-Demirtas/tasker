import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/service/task_service.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>
{
  final TaskRepository taskRepository;

  TaskCubit({required this.taskRepository}) : super(const TaskState(tasks: [], isLoading: false));

  void addTask(Task task) async
  {
    emit(TaskState(isLoading: true, tasks: state.tasks));
    List<Task> tasks = state.tasks.toList();
    await taskRepository.add(task);
    tasks.add(task);
    emit(TaskState(isLoading: false, tasks: tasks));
  }

  Future<void> getAll() async
  {
    emit(TaskState(tasks: state.tasks, isLoading: true));
    List<Task> tasks = await taskRepository.getAll();
    emit(TaskState(tasks: tasks, isLoading: false));
  }

  Future<void> delete(int id) async
  {
    taskRepository.delete(id);
  }
}
