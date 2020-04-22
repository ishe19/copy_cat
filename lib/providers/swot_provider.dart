import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerSWOT {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'VPAnswers.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table strengths(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table weaknesses(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null

          );''');
      await db.execute('''
          create table opportunities(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table threats(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
    });
  }

  static Future<List> getLists(String tableName, int modelID) async {
    if (db == null) {
      await openDB();
    } else {
      if (tableName == "one") {
        List<Map> results = await db.query("strengths",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "two") {
        List<Map> results = await db.query("weaknesses",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "three") {
        List<Map> results = await db.query("opportunities",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "four") {
        List<Map> results = await db.query("threats",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      }
    }
  }

  static Future insertCustSegNote(
      Map<String, dynamic> note, String tableName) async {
    if (tableName == "one") {
      await db.insert('strengths', note);
    } else if (tableName == "two") {
      await db.insert('weaknesses', note);
    } else if (tableName == "three") {
      await db.insert('opportunities', note);
    } else if (tableName == "four") {
      await db.insert('threats', note);
    }
  }

  static Future updateCustSegNote(
      Map<String, dynamic> note, String tableName) async {
    if (tableName == "one") {
      await db
          .update('strengths', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "two") {
      await db
          .update('weaknesses', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "three") {
      await db
          .update('opportunities', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "four") {
      await db
          .update('threats', note, where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "one") {
      await db.delete('strengths', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "two") {
      await db.delete('weaknesses', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "three") {
      await db.delete('opportunities', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "four") {
      await db.delete('threats', where: 'id = ?', whereArgs: [id]);
    }
  }

}