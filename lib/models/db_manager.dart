import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerViews {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'canvasAppK.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table customer_segments(
            id integer primary key autoincrement,
            title text not null,         
            modelID text not null
          );''');
      await db.execute('''
          create table value_propositions(
            id integer primary key autoincrement,
            title text not null,           
            modelID integer not null
          );''');
      await db.execute('''
          create table channels(
            id integer primary key autoincrement,
            title text not null,         
            modelID text not null
          );''');
      await db.execute('''
          create table revenue_stream(
            id integer primary key autoincrement,
            title text not null,       
            modelID text not null
          );''');
      await db.execute('''
          create table customer_relationships(
            id integer primary key autoincrement,
            title text not null,       
            modelID text not null
          );''');
      await db.execute('''
          create table key_resources(
            id integer primary key autoincrement,
            title text not null,       
            modelID text not null
          );''');
      await db.execute('''
          create table key_activities(
            id integer primary key autoincrement,
            title text not null,         
            modelID text not null
          );''');
      await db.execute('''
          create table key_partners(
            id integer primary key autoincrement,
            title text not null,    
            modelID text not null
          );''');
      await db.execute('''
          create table cost_structure(
            id integer primary key autoincrement,
            title text not null,          
            modelID text not null
          );''');
    });
  }

  static Future<List> getLists(String tableName, int modelID) async {
    if (db == null) {
      await openDB();
    } else {
      if (tableName == "Customer Segments") {
        List<Map> results = await db.query("customer_segments",
            columns: ["id", "title","modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Value Propositions") {
        List<Map> results = await db.query("value_propositions",
            columns: ["id", "title","modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Channels") {
        List<Map> results = await db.query("channels",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Customer Relationships") {
        List<Map> results = await db.query("customer_relationships",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Revenue Streams") {
        List<Map> results = await db.query("revenue_stream",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Key Resources") {
        List<Map> results = await db.query("key_resources",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Key Activities") {
        List<Map> results = await db.query("key_activities",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Key Partners") {
        List<Map> results = await db.query("key_partners",
            columns: ["id", "title", "modelID"],
            where: 'modelID = ?',
            whereArgs: [modelID]);

        if (results.length > 0) {
          return results;
        }
        return null;
      } else if (tableName == "Cost Structure") {
        List<Map> results = await db.query("cost_structure",
            columns: ["id", "title", "modelID"],
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
    if (tableName == "Customer Segments") {
      await db.insert('customer_segments', note);
    } else if (tableName == "Value Propositions") {
      await db.insert('value_propositions', note);
    } else if (tableName == "Channels") {
      await db.insert('channels', note);
    } else if (tableName == "Customer Relationships") {
      await db.insert('customer_relationships', note);
    } else if (tableName == "Revenue Streams") {
      await db.insert('revenue_stream', note);
    } else if (tableName == "Key Resources") {
      await db.insert('key_resources', note);
    } else if (tableName == "Key Activities") {
      await db.insert('key_activities', note);
    } else if (tableName == "Key Partners") {
      await db.insert('key_partners', note);
    } else if (tableName == "Cost Structure") {
      await db.insert('cost_structure', note);
    }
  }

  static Future updateCustSegNote(
      Map<String, dynamic> note, String tableName) async {
    if (tableName == "Customer Segments") {
      await db.update('customer_segments', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Value Propositions") {
      await db.update('value_propositions', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Channels") {
      await db
          .update('channels', note, where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Customer Relationships") {
      await db.update('customer_relationships', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Revenue Streams") {
      await db.update('revenue_stream', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Key Resources") {
      await db.update('key_resources', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Key Activities") {
      await db.update('key_activities', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Key Partners") {
      await db.update('key_partners', note,
          where: 'id = ?', whereArgs: [note['id']]);
    } else if (tableName == "Cost Structure") {
      await db.update('cost_structure', note,
          where: 'id = ?', whereArgs: [note['id']]);
    }
  }

  static Future deleteNote(int id, String tableName) async {
    if (tableName == "Customer Segments") {
      await db.delete('customer_segments', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Value Propositions") {
      await db.delete('value_propositions', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Channels") {
      await db.delete('channels', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Customer Relationships") {
      await db
          .delete('customer_relationships', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Revenue Streams") {
      await db.delete('revenue_stream', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Key Resources") {
      await db.delete('key_resoures', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Key Activities") {
      await db.delete('key_resources', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Key Partners") {
      await db.delete('key_partners', where: 'id = ?', whereArgs: [id]);
    } else if (tableName == "Cost Structure") {
      await db.delete('cost_structure', where: 'id = ?', whereArgs: [id]);
    }
  }
}

class DBManagerModel {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'canvasAppModel.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table models(
            id integer primary key autoincrement,
            ModelTitle text not null,
            ModelDescription text not null,
            For text not null,
            By text not null
          );''');
    });
  }

  static Future insertModel(Map<String, dynamic> note) async {
    await db.insert('models', note);
  }

  static Future deleteModel(int id) async {
    await db.delete('models', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update('models', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('models');
    }
  }

  //  static Future<List<Map<String, dynamic>>> getId(String title) async {
  //   if (db == null) {
  //     await openDB();
  //   }else{
  //     // return await db.query('models');
  //     String test = db.rawQuery('SELECT `id` FROM `models` WHERE `ModelTitle` = "Test Title"');
  //     return await
  //   }

  //  }

}

class DBManagerSwot {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'canvasAppSwot.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table swot(
            id integer primary key autoincrement,
            SwotTitle text not null,
            SwotDescription text not null
          );''');
    });
  }

  static Future insertSwot(Map<String, dynamic> note) async {
    await db.insert('swot', note);
  }

  static Future deleteModel(int id) async {
    await db.delete('swot', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update('swot', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('swot');
    }
  }
}



class Note {
  int id;
  String title;
  String description;
  String modelID;

  Note({this.id, this.title, this.description, this.modelID});

  // int get id => id;
  // String get title => title;
  // String get description => description;
  // String get modelID => modelID;

  factory Note.fromMap(Map<String, dynamic> data) => new Note(
        id: data["id"],
        title: data["title"],
        description: data["description"],
        modelID: data["modelID"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "Ttitle": title,
        "description": description,
        "modelID": modelID,
      };
}

class DBManagerCustomer {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'CustomerDb.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table Subject (
            id integer primary key autoincrement,
            SubjectTitle text not null
          );''');
    });
  }

  static Future insertSubject(Map<String, dynamic> note) async {
    await db.insert('Subject', note);
  }

  static Future deleteSubject(int id) async {
    await db.delete('Subject', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateSubject(Map<String, dynamic> note) async {
    await db.update('Subject', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getSubjectList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('Subject');
    }
  }
}


class DBManagerIGC {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'IgcDb.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table igc (
            id integer primary key autoincrement,
            SubjectTitle text not null
          );''');
    });
  }

  static Future insertSubject(Map<String, dynamic> note) async {
    await db.insert('igc', note);
  }

  static Future deleteSubject(int id) async {
    await db.delete('igc', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateSubject(Map<String, dynamic> note) async {
    await db.update('igc', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getSubjectList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('igc');
    }
  }
}


class DBManagerProjects {
  static Database db;
  static Future openDB() async {
    db = await openDatabase(join(await getDatabasesPath(), 'projects.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
          create table projects(
            id integer primary key autoincrement,
            ModelTitle text not null,
            ModelDescription text not null
          );''');
    });
  }

  static Future insertItem(Map<String, dynamic> note) async {
    await db.insert('projects', note);
  }

  static Future deleteItem(int id) async {
    await db.delete('projects', where: 'id = ?', whereArgs: [id]);
  }

  static Future updateItem(Map<String, dynamic> note) async {
    await db.update('projects', note, where: 'id = ?', whereArgs: [note['id']]);
  }

  static Future<List<Map<String, dynamic>>> getItemList() async {
    if (db == null) {
      await openDB();
    } else {
      return await db.query('projects');
    }
  }
}