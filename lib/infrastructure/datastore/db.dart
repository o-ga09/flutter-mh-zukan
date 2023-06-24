import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../core/utils/const.dart';
import './model.dart';

final dbDatasourceProvider =
    Provider<DBstoreDatasource>(
  (ref) => DBstoreDatasourceImpl(),
);

abstract class DBstoreDatasource {
  Future<Database> openDB();
  Future<Data> GetById(int id);
  Future<List<Data>> GetAll();
  Future<void> Insert(List<Data> data);
  Future<void> Delete(int id);
  Future<void> Update(int id, Data data);
}

class DBstoreDatasourceImpl implements DBstoreDatasource {
  @override
  Future<Database> openDB() async {
    // データベースファイルが存在する場合は削除
    // デバッグ用
    final databasePath = join(await getDatabasesPath(), DbFileName);
    await deleteDatabase(databasePath);

    return await openDatabase(
      databasePath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $TableName(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, types TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<Data> GetById(int id) async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query(
      TableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      var res = Data(id: maps.first['id'], name: maps.first['name'], imgUrl: maps.first['imageUrl'], types: json.decode(maps.first['types']));
      return res; 
    }

    return Data(id: -1, name: '', imgUrl: '', types: []);
  }

  @override
  Future<List<Data>> GetAll() async {
    var db = await openDB();

    final List<Map<String, dynamic>> maps = await db.query(TableName);

    return List.generate(maps.length, (index) {
      return Data(
        id: maps[index]['id'],
        name: maps[index]['name'],
        imgUrl: maps[index]['imageUrl'],
        types: json.decode(maps[index]['types']),
      );
    });
  }

  @override
  Future<void> Insert(List<Data> data) async {
    var db = await openDB();

    await db.transaction((txn) async {
      for (var d in data) {
        final String typesJson = json.encode(d.types);
        await txn.insert(
          TableName,
          {'id': d.id, 'name': d.name, 'imageUrl': d.imgUrl, 'types': typesJson},
        );
      }
    });
  }

  @override
  Future<void> Delete(int id) async {
    var db = await openDB();

    await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> Update(int id, Data data) async {
    var db = await openDB();

    await db.transaction((txn) async {
        final String typesJson = json.encode(data.types);
        await txn.update(
          TableName,
          {'name': data.name, 'imageUrl': data.imgUrl, 'types': typesJson},
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    );
  }
}