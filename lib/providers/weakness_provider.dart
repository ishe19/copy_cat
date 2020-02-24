import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class WeakProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'weaknesses.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Weaknesses(
            id integer primary key autoincrement,
            title text not null,
            text text not null,
            swotID text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getWeakList(String swotID) async {
    if (db == null) {
      await open();
    }{
    // return await db.query('Opps');

     List<Map> results = await db.query("Weaknesses",
      columns: ["id", "title", "text", "swotID"],
      where: 'swotID = ?',
      whereArgs: [swotID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }
  }

  static Future insertWeak(Map<String, dynamic> note) async {
    await db.insert('Weaknesses', note);
  }

  static Future updateWeak(Map<String, dynamic> note) async {
    await db.update(
      'Weaknesses',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteWeak(int id) async {
    await db.delete(
      'Weaknesses',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}