
import 'package:tasker/core/helper/database_provider.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/service/base_repository.dart';

abstract class TaskRepository extends BaseRepository<Task>
{}

class TaskDBService implements TaskRepository
{
  @override
  Future<void> add(Task task) async
  {
    await DatabaseProvider().saveTask(task);
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() {
    return DatabaseProvider().getAllTasks();
  }

  @override
  Future<void> update(Task t) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
