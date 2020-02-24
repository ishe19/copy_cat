import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ThreatProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'Threats.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Threats(
            id integer primary key autoincrement,
            title text not null,
            text text not null,
            swotID text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getThreatList(String swotID) async {
    if (db == null) {
      await open();
    }{
    // return await db.query('Opps');

     List<Map> results = await db.query("Threats",
      columns: ["id", "title", "text", "swotID"],
      where: 'swotID = ?',
      whereArgs: [swotID]);


      if (results.length > 0) {
        return results;
      }
      return null;
    }
  }

  static Future insertThreat(Map<String, dynamic> note) async {
    await db.insert('Threats', note);
  }

  static Future updateThreat(Map<String, dynamic> note) async {
    await db.update(
      'Threats',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteThreat(int id) async {
    await db.delete(
      'Threats',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}