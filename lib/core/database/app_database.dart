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
        // Create categories table
        db.execute('''CREATE TABLE categories (
          id TEXT PRIMARY KEY, 
          title TEXT
        )''');

        // Create category_contents table
        db.execute('''CREATE TABLE category_contents (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          category_id TEXT, 
          title TEXT, 
          image_url TEXT,
          FOREIGN KEY (category_id) REFERENCES categories (id)
        )''');

        // Create banners table
        db.execute('''CREATE TABLE banners (
          id TEXT PRIMARY KEY, 
          title TEXT
        )''');

        // Create banner_contents table
        db.execute('''CREATE TABLE banner_contents (
          banner_id TEXT, 
          title TEXT, 
          image_url TEXT,
          FOREIGN KEY (banner_id) REFERENCES banners (id)
        )''');

        // Create products table
        db.execute('''CREATE TABLE products (
          id TEXT PRIMARY KEY, 
          title TEXT
        )''');

        // Create product_contents table
        db.execute('''CREATE TABLE product_contents (
          product_id TEXT, 
          sku TEXT, 
          product_name TEXT, 
          product_image TEXT, 
          product_rating INTEGER, 
          actual_price TEXT, 
          offer_price TEXT, 
          discount TEXT,
          FOREIGN KEY (product_id) REFERENCES products (id)
        )''');
      },
      version: 1,
    );
  }
}
