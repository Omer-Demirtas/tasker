import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasker/core/model/task.dart';

class DatabaseProvider {

  DatabaseProvider._();

  static final DatabaseProvider _db = DatabaseProvider._();

  static Database? _database;

  static String tableTask = 'T_TASK';

  factory DatabaseProvider() {
    return _db;
  }

  Future<Database> get database async {
    print("database get method");
    if (_database != null) return _database!;
    print("database initialize");
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'Tasks.db');

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async
  {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const stringType = 'TEXT NOT NULL';
    const boolType = 'INTEGER NOT NULL default 0';
    const integerType = 'INTEGER NOT NULL';

    print('tablet createDB method');
    print('**************************************');

    await db.execute(
        '''
              CREATE TABLE $tableTask (
                id $idType, 
                cron $stringType,
                title $stringType,
                description $stringType,
                is_cyclical $boolType,
                date $integerType,
                start_at $integerType,
                finish_at $integerType
              )
            '''
    );
  }

  Future<void> saveTask(Task task) async
  {
    final db = await _db.database;

    final id = await db.insert(tableTask, Task.toMap(task));
  }
  
  Future<List<Task>> getAllTasks() async
  {
    final db = await _db.database;

    const orderBy = 'id ASC';

    final result = await db.query(tableTask);

    print(result.length);

    return result.map((e) => Task.fromMap(e)).toList();
  }

  Future<void> deleteAll() async
  {
    final db = await _db.database;

    final result = await db.delete(tableTask);
  }
}