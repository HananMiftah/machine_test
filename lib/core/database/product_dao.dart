import 'package:sqflite/sqflite.dart';
import 'app_database.dart';
import '../../models/product.dart';

class ProductDao {
  Future<Database> get _db async => await AppDatabase().database;

  Future<void> insertProduct(ProductModel product) async {
    final db = await _db;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertProducts(List<ProductModel> products) async {
    final db = await _db;
    for (var product in products) {
      await db.insert(
        'products',
        product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<ProductModel>> getProducts() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return ProductModel.fromMap(maps[i]);
    });
  }
}
