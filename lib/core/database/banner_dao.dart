import 'package:sqflite/sqflite.dart';
import 'app_database.dart';
import '../../models/banner.dart';

class BannerDao {
  Future<Database> get _db async => await AppDatabase().database;

  Future<void> insertBanner(BannerModel banner) async {
    final db = await _db;
    await db.insert(
      'banners',
      banner.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertBanners(List<BannerModel> banners) async {
    final db = await _db;
    for (var banner in banners) {
      await db.insert(
        'banners',
        banner.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<BannerModel>> getBanners() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('banners');
    return List.generate(maps.length, (i) {
      return BannerModel.fromMap(maps[i]);
    });
  }
}
