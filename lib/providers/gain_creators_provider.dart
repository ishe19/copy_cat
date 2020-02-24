import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GainsProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'Gain.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Gains(
            id integer primary key autoincrement,
            title text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getGainsList() async {
    if (db == null) {
      await open();
    }

    return await db.query('Gains');
   


      
    
  }

  static Future insertGains(Map<String, dynamic> note) async {
    await db.insert('Gains', note);
  }

  static Future updateGains(Map<String, dynamic> note) async {
    await db.update(
      'Gains',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteGains(int id) async {
    await db.delete(
      'Gains',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}