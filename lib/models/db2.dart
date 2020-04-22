import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerGuide1 {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'IGCAnswers.db'),
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
            await db.execute('''
          create table Answers7(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers8(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null

          );''');
      await db.execute('''
          create table Answers9(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers10(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers11(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
      await db.execute('''
          create table Answers12(
            id integer primary key autoincrement,
            answer text not null,
            modelID text not null
          );''');
            await db.execute('''
          create table Answers13(
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
      }else {
      if (tableName == "seven") {
        List<Map> results = await db.query("Answers7",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "eight") {
        List<Map> results = await db.query("Answers8",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "nine") {
        List<Map> results = await db.query("Answers9",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "ten") {
        List<Map> results = await db.query("Answers10",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "eleven") {
        List<Map> results = await db.query("Answers11",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "twelve") {
        List<Map> results = await db.query("Answers12",
            columns: ["id", "answer", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      }else if (tableName == "thirteen") {
        List<Map> results = await db.query("Answers13",
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
    } else if (tableName == "seven") {
      await db.insert('Answers7', note);
    } else if (tableName == "eight") {
      await db.insert('Answers8', note);
    } else if (tableName == "nine") {
      await db.insert('Answers9', note);
    } else if (tableName == "ten") {
      await db.insert('Answers10', note);
    } else if (tableName == "eleven") {
      await db.insert('Answers11', note);
    }else if (tableName == "twelve") {
      await db.insert('Answers12', note);
    } else if (tableName == "thirteen") {
      await db.insert('Answers13', note);
    }
  }

  static Future updateCustSegNote(
      Map<String, dynamic> note, String tableName) async {
    if (tableName == "one") {
      await db
          .update('Answers1', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "two") {
      await db
          .update('Answers2', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "three") {
      await db
          .update('Answers3', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "four") {
      await db
          .update('Answers4', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "five") {
      await db
          .update('Answers5', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "six") {
      await db
          .update('Answers6', note, where: 'id = ?', whereArgs: [note['id']]);
    }else if (tableName == "seven") {
      await db
          .update('Answers7', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "eight") {
      await db
          .update('Answers8', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "nine") {
      await db
          .update('Answers9', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "ten") {
      await db
          .update('Answers10', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "eleven") {
      await db
          .update('Answers11', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "twelve") {
      await db
          .update('Answers12', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "thirteen") {
      await db
          .update('Answers13', note, where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "one") {
      await db.delete('Answers1', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "two") {
      await db.delete('Answers2', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "three") {
      await db.delete('Answers3', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "four") {
      await db.delete('Answers4', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "50") {
      await db.delete('Answers5', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "five") {
      await db.delete('Answers6', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "six") {
      await db.delete('Answers7', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "seven") {
      await db.delete('Answers8', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "eight") {
      await db.delete('Answers8', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "nine") {
      await db.delete('Answers9', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "ten") {
      await db.delete('Answers10', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "eleven") {
      await db.delete('Answers11', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "twelve") {
      await db.delete('Answers12', where: 'id = ?', whereArgs: [id]);
    }else if (tableName == "thirteen") {
      await db.delete('Answers13', where: 'id = ?', whereArgs: [id]);
    }
  }
}


class DBManagerQueAnswers {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'QueAnswers.db'),
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
    if (tableName == "one") {
      await db
          .update('Answers1', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "two") {
      await db
          .update('Answers2', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "three") {
      await db
          .update('Answers3', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "four") {
      await db
          .update('Answers4', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "five") {
      await db
          .update('Answers5', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "six") {
      await db
          .update('Answers6', note, where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "one") {
      await db.delete('Answers1', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "two") {
      await db.delete('Answers2', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "three") {
      await db.delete('Answers3', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "four") {
      await db.delete('Answers4', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "five") {
      await db.delete('Answers5', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "six") {
      await db.delete('Answers6', where: 'id = ?', whereArgs: [id]);
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
    if (tableName == "one") {
      await db
          .update('Answers1', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "two") {
      await db
          .update('Answers2', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "three") {
      await db
          .update('Answers3', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "four") {
      await db
          .update('Answers4', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "five") {
      await db
          .update('Answers5', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "six") {
      await db
          .update('Answers6', note, where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "one") {
      await db.delete('Answers1', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "two") {
      await db.delete('Answers2', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "three") {
      await db.delete('Answers3', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "four") {
      await db.delete('Answers4', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "five") {
      await db.delete('Answers5', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "six") {
      await db.delete('Answers6', where: 'id = ?', whereArgs: [id]);
    }
  }

}

