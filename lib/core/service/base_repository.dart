

abstract class BaseRepository<T>
{
  Future<void> add(T t);
  Future<void> update(T t);
  Future<void> delete(int id);
  Future<List<T>> getAll();
  Future<void> deleteAll();
}