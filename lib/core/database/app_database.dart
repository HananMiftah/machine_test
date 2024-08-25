import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  AppDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) {
        db.execute('''CREATE TABLE categories(id INTEGER PRIMARY KEY, title TEXT, imageUrl TEXT)''');
        db.execute('''CREATE TABLE banners(id INTEGER PRIMARY KEY, title TEXT, imageUrl TEXT)''');
        db.execute('''CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, actualPrice TEXT, offerPrice TEXT, discount TEXT, rating INTEGER)''');
      },
      version: 1,
    );
  }
}
