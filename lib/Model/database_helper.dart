import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Contacts.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    var version = await _db?.database.getVersion();
    return _db;
  }

  initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'contacts.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE contacts(id INTEGER PRIMARY KEY,image TEXT, firstName TEXT, lastName TEXT, phoneNumber INTEGER, address TEXT, city TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (newVersion == 2) {
          db.execute('ALTER TABLE contacts ADD image TEXT');
        }
      },
      version: 2,
    );
  }

  Future<void> insertContact(Contacts contacts) async {
    final database = await db;
    await database?.insert(
      'contacts',
      contacts.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contacts>> getAllContact() async {
    final database = await db;
    final List<Map<String, dynamic>>? maps = await database?.query('contacts');
    print("$maps");
    return List.generate(
      maps?.length ?? 0,
      (i) {
        return Contacts(
          id: maps?[i]['id'],
          image: maps?[i]['image'],
          firstName: maps?[i]['firstName'],
          lastName: maps?[i]['lastName'],
          phoneNo: maps?[i]['phoneNumber'],
          address: maps?[i]['address'],
          city: maps?[i]['city'],
        );
      },
    );
  }

  Future<void> updateContact(Contacts contacts) async {
    final database = await db;
    await database?.update(
      'contacts',
      contacts.toMap(),
      where: 'id = ?',
      whereArgs: [contacts.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final database = await db;
    await database?.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }
}
