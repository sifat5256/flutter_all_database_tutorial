
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class DBHelper{
  static Database? _database;

  Future<Database> get database async {

    if(_database!=null){
      return _database!;
    }

    else {
       _database = await _initDB();

    }

  }

  Future <Database> _initDB() async{
    String path = join(await getDatabasesPath(),'my_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db,version){
        return db.execute(
          '''
          CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
           name TEXT,
           age INTEGER
          )
          '''
        );
      }

    );




  }

  Future<void> insertUser(String name, int age) async {
    final db = await DBHelper().database;
    await db.insert(
      'users',
      {'name': name, 'age': age},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



}