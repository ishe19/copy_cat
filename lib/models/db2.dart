import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerGuide {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'IGC.db'),
        version: 1, onCreate: (Database db, int version) async {
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
    await db.delete('challenges', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateChallenge(Map<String, dynamic> note) async {
    await db
        .update('challenges', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getListChall2() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('challenges');
    }
  }

  static Future<List<Map<String, dynamic>>> getListChall(int i) async {
    if (db == null) {
      await openDB();
    } else {
      List<Map> results = await db.query("challenges",
          columns: ["title"], where: 'id = ?', whereArgs: [i]);
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
    await db.delete('solutions', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateSolutions(Map<String, dynamic> note) async {
    await db
        .update('solutions', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getListSol() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('solutions');
    }
  }

  // IMPACT METHODS

  static Future insertImpact(Map<String, dynamic> note) async {
    await db.insert('impacts', note);
  }

  static Future deleteImpacts(int id) async {
    await db.delete('impacts', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateImpacts(Map<String, dynamic> note) async {
    await db.update('impacts', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getListImp() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('impacts');
    }
  }
}

class DBManagerCustAnswers {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'testAnswers.db'),
        version: 1, onCreate: (Database db, int version) async {
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
    await db.delete('answers_table', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateAnswer1(Map<String, dynamic> note) async {
    await db.update('answers_table', note,
        where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getAnswer1List() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('answers_table');
    }
  }
}

class DBManagerAnswers {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'VPAnswers.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table Answers1(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers2(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null

          );''');
      await db.execute('''
          create table Answers3(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers4(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers5(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers6(
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
        List<Map> results = await db.query("Answers1",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "two") {
        List<Map> results = await db.query("Answers2",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "three") {
        List<Map> results = await db.query("Answers3",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "four") {
        List<Map> results = await db.query("Answers4",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "five") {
        List<Map> results = await db.query("Answers5",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "six") {
        List<Map> results = await db.query("Answers6",
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
      await db.insert('Answers1', note);
    } else if (tableName == "two") {
      await db.insert('Answers2', note);
    } else if (tableName == "three") {
      await db.insert('Answers3', note);
    } else if (tableName == "four") {
      await db.insert('Answers4', note);
    } else if (tableName == "five") {
      await db.insert('Answers5', note);
    } else if (tableName == "six") {
      await db.insert('Answers6', note);
    }
  }

  static Future updateCustSegNote(
      Map<String, dynamic> note, String tableName) async {
    if (tableName == "two") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "two") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "three") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "four") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "five") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "six") {
      await db
          .update('Answers', note, where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "Customer Segments") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Value Propositions") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Channels") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Customer Relationships") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Revenue Streams") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Key Resources") {
      await db.delete('Answers', where: 'id = ?', whereArgs: [id]);
    }
  }
}
