import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerAnswer1{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'answers1.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table Answer1(
            id integer primary key autoincrement,
            answer text not null,
          );''');
      });
      }

  static Future insertAnswer1(Map<String, dynamic> note) async {
    await db.insert('Answer1', note);
  }

  static Future deleteAnswer1(int id) async {
    await db.delete(
      'Answer1',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateAnswer1(Map<String, dynamic> note) async {
    await db.update(
        'Answer1',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getAnswer1List() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('Answer1');
    }

   }

} 