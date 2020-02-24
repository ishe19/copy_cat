import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PainsProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'Pain.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Pains(
            id integer primary key autoincrement,
            title text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getPainsList() async {
    if (db == null) {
      await open();
    }

    return await db.query('Pains');
   


      
    
  }

  static Future insertPains(Map<String, dynamic> note) async {
    await db.insert('Pains', note);
  }

  static Future updatePains(Map<String, dynamic> note) async {
    await db.update(
      'Pains',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deletePains(int id) async {
    await db.delete(
      'Pains',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}