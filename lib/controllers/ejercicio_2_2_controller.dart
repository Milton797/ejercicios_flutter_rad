import 'dart:typed_data';

import 'package:ejercicios_flutter_rad/models/ejercicio_2_2_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<int> createData(
      String name, String description, Uint8List? signature) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'description': description,
      'signature': signature,
    };
    final id = await db.insert('painter', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS painter (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT NOT NULL,
      description TEXT NOT NULL,
      signature BLOB,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )
    """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      "database_name.db",
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<bool> deleteData(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete('painter', where: 'id = ?', whereArgs: [id]);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Signature> getItem(int id) async {
    final db = await SQLHelper.db();
    final dynamic data =
        db.query('painter', where: 'id = ?', whereArgs: [id], limit: 1);
    return Signature(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      signature: data['signature'],
      createdAt: data['createdAt'],
    );
  }

  static Future<List<Map<int, Signature>>> getItems() async {
    final db = await SQLHelper.db();
    final data = await db.query('painter', orderBy: 'id');
    final List<Map<int, Signature>> dataFinal = [];

    for (dynamic element in data) {
      dataFinal.add(
        {
          element['id']: Signature(
            id: element['id'],
            name: element['name'],
            description: element['description'],
            signature: element['signature'],
            createdAt: element['createdAt'],
          ),
        },
      );
    }
    return dataFinal;
  }

  static Future<bool> updateData(
      int id, String name, String description) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('painter', data, where: 'id = ?', whereArgs: [id]);
    return result > 0;
  }
}
