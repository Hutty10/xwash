import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DBServices {
  Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    log('gotten db path');
    return sql.openDatabase(
      path.join(dbPath, 'xwash.db'),
      onCreate: (db, version) => db.execute(
          'CREATE TABLE xwash(id TEXT PRIMARY KEY, type TEXT,num TEXT, cvv TEXT,exp TEXT)'),
      version: 1,
    );
  }

  Future<void> insert(Map<String, dynamic> data) async {
    final db = await database();
    log('ssssss');
    db.insert(
      'card',
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await database();
    log('message');
    // print(db.query('card'));
    return db.query('card');
  }
}

final dbServicesProvider = Provider<DBServices>((ref) => DBServices());
final insertCardProvider = FutureProvider.family<void, Map<String, dynamic>>(
  (ref, data) async => await ref.read(dbServicesProvider).insert(data),
);
final getCardProvider = FutureProvider<List<Map<String, dynamic>>>(
  (ref) async => await ref.read(dbServicesProvider).getData(),
);
