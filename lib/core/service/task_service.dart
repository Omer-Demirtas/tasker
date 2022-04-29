
import 'package:tasker/core/helper/database_provider.dart';
import 'package:tasker/core/model/task.dart';
import 'package:tasker/core/service/base_repository.dart';

abstract class TaskRepository extends BaseRepository<Task>
{
  Future<List<Task>> getByDate(DateTime dateTime);
}

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

  @override
  Future<void> deleteAll() async
  {
    return await DatabaseProvider().deleteAll();
  }

  @override
  Future<List<Task>> getByDate(DateTime date) async
  {
    DateTime startAt = DateTime(date.year, date.month, date.day, 0, 0);
    DateTime finishAt = DateTime(date.year, date.month, date.day, 23, 59);

    return DatabaseProvider().getAllTaskByDate(startAt, finishAt);
  }
}
