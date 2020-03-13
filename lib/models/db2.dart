import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBManagerGuide {
  static Database db; 

  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'IGC.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table challenges(
            id integer primary key autoincrement,
            question text not null,
            title text not null
          );''');
          await db.execute('''
          create table impacts(
            id integer primary key autoincrement,
            question text not null,
            title text not null
          );''');
          await db.execute('''
          create table solutions(
            id integer primary key autoincrement,
            question text not null,
            title text not null
          );''');
      });
  }

  // CHALLENGE METHODS

  static Future insertChallenge(Map<String, dynamic> note) async {
    await db.insert('challenges', note);
  }

  static Future deleteChallenge(int id) async {
    await db.delete(
      'challenges',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateChallenge(Map<String, dynamic> note) async {
    await db.update(
        'challenges',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getListChall2() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('challenges');
    }

   }

    static Future<List<Map<String, dynamic>>> getListChall(int i) async {
    if (db == null) {
      await openDB();
    }else{
      List<Map> results = await db.query("challenges",
      columns: ["title"],
      where: 'id = ?',
      whereArgs: [i]);
      // return await db.query('challenges');
      if (results.length > 0) {
        return results;
      }
    }

   }

   // SOLUTIONS METHODS

    static Future insertSolutions(Map<String, dynamic> note) async {
    await db.insert('solutions', note);
  }

  static Future deleteSolutions(int id) async {
    await db.delete(
      'solutions',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateSolutions(Map<String, dynamic> note) async {
    await db.update(
        'solutions',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getListSol() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('solutions');
    }

}

   // IMPACT METHODS

    static Future insertImpact(Map<String, dynamic> note) async {
    await db.insert('impacts', note);
  }

  static Future deleteImpacts(int id) async {
    await db.delete(
      'impacts',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateImpacts(Map<String, dynamic> note) async {
    await db.update(
        'impacts',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getListImp() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('impacts');
    }

   }


}

class DBManagerCustAnswers {
  static Database db; 

  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'testAnswers.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table answers_table(
            id integer primary key autoincrement,
            answer text not null
          );''');
          
      });
  }

  static Future insertAnswer1(Map<String, dynamic> note) async {
    await db.insert('answers_table', note);
  }

  static Future deleteAnswer1(int id) async {
    await db.delete(
      'answers_table',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateAnswer1(Map<String, dynamic> note) async {
    await db.update(
        'answers_table',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getAnswer1List() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('answers_table');
    }

   }

} 