import 'package:sqflite/sqflite.dart';
import 'app_database.dart';
import '../../models/category.dart';

class CategoryDao {
  Future<Database> get _db async => await AppDatabase().database;

  Future<void> insertCategory(CategoryModel category) async {
    final db = await _db;
    await db.insert('categories', category.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CategoryModel>> getCategories() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return List.generate(maps.length, (i) {
      return CategoryModel.fromMap(maps[i]);
    });
  }
}
