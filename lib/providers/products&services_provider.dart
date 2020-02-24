import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductProvider {
  static Database db;

  static Future open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'products.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        db.execute('''
          create table Products(
            id integer primary key autoincrement,
            title text not null
          );
        ''');
      }
    );
  }

  static Future<List<Map<String, dynamic>>> getProductsList() async {
    if (db == null) {
      await open();
    }

    return await db.query('Products');
     
  }

  static Future insertProducts(Map<String, dynamic> note) async {
    await db.insert('Products', note);
  }

  static Future updateProducts(Map<String, dynamic> note) async {
    await db.update(
      'Products',
      note,
      where: 'id = ?',
      whereArgs: [note['id']]);
  }

  static Future deleteProducts(int id) async {
    await db.delete(
      'Products',
      where: 'id = ?',
      whereArgs: [id]);
  } 
}