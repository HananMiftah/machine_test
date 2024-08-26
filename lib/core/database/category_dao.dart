import 'package:sqflite/sqflite.dart';
import 'app_database.dart';
import '../../models/category.dart';

class CategoryDao {
  Future<Database> get _db async => await AppDatabase().database;

  Future<void> insertCategories(List<CategoryModel> categories) async {
    final db = await _db;

    // Start a transaction to ensure all inserts are done atomically
    await db.transaction((txn) async {
      for (var category in categories) {
        // Insert category
        await txn.insert(
          'categories',
          {
            'id': category.id,
            'title': category.title,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        // Insert category contents
        for (var content in category.contents) {
          await txn.insert(
            'category_contents',
            {
              'category_id': category.id,
              'title': content.title,
              'image_url': content.imageUrl,
            },
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
    });
  }

  Future<List<CategoryModel>> getCategories() async {
    final db = await _db;

    // Get categories
    final List<Map<String, dynamic>> categoryMaps =
        await db.query('categories');
    final List<CategoryModel> categories = [];

    // Get associated contents for each category
    for (var categoryMap in categoryMaps) {
      final List<Map<String, dynamic>> contentMaps = await db.query(
        'category_contents',
        where: 'category_id = ?',
        whereArgs: [categoryMap['id']],
      );

      final List<CategoryContent> contents = contentMaps.map((contentMap) {
        return CategoryContent.fromMap(contentMap);
      }).toList();

      categories.add(CategoryModel(
        id: categoryMap['id'],
        title: categoryMap['title'],
        contents: contents,
      ));
    }

    return categories;
  }
}
