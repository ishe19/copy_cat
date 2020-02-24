import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManagerViews {
  static Database db;

  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppK.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table customer_segments(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table value_propositions(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID integer not null
          );''');
        await db.execute('''
          create table channels(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table revenue_stream(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table customer_relationships(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_resources(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_activities(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
        await db.execute('''
          create table key_partners(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
          await db.execute('''
          create table cost_structure(
            id integer primary key autoincrement,
            title text not null,
            description text not null,
            modelID text not null
          );''');
      }
    );
  }



  static Future<List> getLists(String tableName, int modelID) async {
    if (db == null) {
      await openDB();
    }else{
    if(tableName == "Customer Segments") {
      List<Map> results = await db.query("customer_segments",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Value Propositions") {
      List<Map> results = await db.query("value_propositions",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Channels") {
      List<Map> results = await db.query("channels",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Customer Relationships") {
      List<Map> results = await db.query("customer_relationships",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName =="Revenue Streams") {
      List<Map> results = await db.query("revenue_stream",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Resources") {
      List<Map> results = await db.query("key_resources",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Activities") {
      List<Map> results = await db.query("key_activities",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Key Partners") {
      List<Map> results = await db.query("key_partners",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }else if(tableName == "Cost Structure") {
      List<Map> results = await db.query("cost_structure",
      columns: ["id", "title", "description", "modelID"],
      where: 'modelID = ?',
      whereArgs: [modelID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }

    }
  }


  static Future insertCustSegNote(Map<String, dynamic> note, String tableName) async {
    if(tableName == "Customer Segments") {
      await db.insert('customer_segments', note);
    }else if(tableName == "Value Propositions") {
      await db.insert('value_propositions', note);
    }else if(tableName == "Channels") {
      await db.insert('channels', note);
    }else if(tableName == "Customer Relationships") {
      await db.insert('customer_relationships', note);
    }else if(tableName =="Revenue Streams") {
      await db.insert('revenue_stream', note);
    }else if(tableName == "Key Resources") {
      await db.insert('key_resources', note);
    }else if(tableName == "Key Activities") {
      await db.insert('key_activities', note);
    }else if(tableName == "Key Partners") {
      await db.insert('key_partners', note);
    }else if(tableName == "Cost Structure") {
      await db.insert('cost_structure', note);
    }
    
  }

  static Future updateCustSegNote(Map<String, dynamic> note, String tableName) async {
    
      if(tableName == "Customer Segments") {
      await db.update(
      'customer_segments',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Value Propositions") {
      await db.update(
      'value_propositions',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Channels") {
      await db.update(
      'channels',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Customer Relationships") {
      await db.update(
      'customer_relationships',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName =="Revenue Streams") {
      await db.update(
      'revenue_stream',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Key Resources") {
      await db.update(
      'key_resources',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Key Activities") {
      await db.update(
      'key_activities',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Key Partners") {
      await db.update(
      'key_partners',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }else if(tableName == "Cost Structure") {
      await db.update(
      'cost_structure',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
    }



  }

  static Future deleteNote(int id, String tableName) async {

      if(tableName == "Customer Segments") {
      await db.delete(
      'customer_segments',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Value Propositions") {
      await db.delete(
      'value_propositions',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Channels") {
      await db.delete(
      'channels',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Customer Relationships") {
      await db.delete(
      'customer_relationships',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName =="Revenue Streams") {
      await db.delete(
      'revenue_stream',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Key Resources") {
      await db.delete(
      'key_resoures',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Key Activities") {
      await db.delete(
      'key_resources',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Key Partners") {
      await db.delete(
      'key_partners',
      where: 'id = ?',
      whereArgs: [id]);
    }else if(tableName == "Cost Structure") {
      await db.delete(
      'cost_structure',
      where: 'id = ?',
      whereArgs: [id]);
    }

  }


}


class DBManagerModel{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppModel.db'),
      version: 1,
      onCreate: (Database db, int version) async {
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
    await db.delete(
      'models',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update(
        'models',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
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





class DBManagerSwot{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'canvasAppSwot.db'),
      version: 1,
      onCreate: (Database db, int version) async {
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
    await db.delete(
      'swot',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateModel(Map<String, dynamic> note) async {
    await db.update(
        'swot',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('swot');
    }

   }

}  


class DBManagerChallenge{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'challenges.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table Challenge(
            id integer primary key autoincrement,
            challengeTitle text not null,
            challengeDescription text not null
          );''');
      });
      }

       static Future insertChallenge(Map<String, dynamic> note) async {
    await db.insert('Challenge', note);
  }

  static Future deleteChallenge(int id) async {
    await db.delete(
      'Challenge',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateChallenge(Map<String, dynamic> note) async {
    await db.update(
        'Challenge',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('Challenge');
    }

   }

}  

class DBManagerImpact{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'Impact.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table Impact(
            id integer primary key autoincrement,
            ImpactTitle text not null,
            ImpactDescription text not null
          );''');
      });
      }

       static Future insertImpact(Map<String, dynamic> note) async {
    await db.insert('Impact', note);
  }

  static Future deleteImpact(int id) async {
    await db.delete(
      'Impact',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateImpact(Map<String, dynamic> note) async {
    await db.update(
        'Impact',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('Impact');
    }

   }

} 

class DBManagerSolutions{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'solutions.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table Solutions(
            id integer primary key autoincrement,
            solutionsTitle text not null,
          );''');
      });
      }

       static Future insertSolutions(Map<String, dynamic> note) async {
    await db.insert('Solutions', note);
  }

  static Future deleteSolutions(int id) async {
    await db.delete(
      'Solutions',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateSolutions(Map<String, dynamic> note) async {
    await db.update(
        'Solutions',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('Solutions');
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

class DBManagerCustomer{
  static Database db;
  static Future openDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'customer.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create Customer (
            id integer primary key autoincrement,
            customerTitle text not null
            
          );''');
      });
      }

       static Future insertCustomer(Map<String, dynamic> note) async {
    await db.insert('Customer', note);
  }

  static Future deleteCustomer(int id) async {
    await db.delete(
      'Customer',
      where: 'id = ?',
      whereArgs: [id]);
  }

  static Future updateCustomer(Map<String, dynamic> note) async {
    await db.update(
        'Customer',
        note,
        where: 'id = ?',
        whereArgs: [note['id']]);
  }

   static Future<List<Map<String, dynamic>>> getCustomerList() async {
    if (db == null) {
      await openDB();
    }else{
      return await db.query('Customer');
    }

   }

}  