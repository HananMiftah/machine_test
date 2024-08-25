import 'package:flutter/foundation.dart';
import '../core/network/api_service.dart';
import '../core/database/category_dao.dart';
import '../core/database/banner_dao.dart';
import '../core/database/product_dao.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product.dart';

class HomeViewModel extends ChangeNotifier {
  // List<Category> _categories = [];
  List<CategoryModel> _categories = [];
  List<BannerModel> _banners = [];
  List<ProductModel> _products = [];

  bool _loading = false;
  String? _error;

  final ApiService _apiService = ApiService();
  final CategoryDao _categoryDao = CategoryDao();
  final BannerDao _bannerDao = BannerDao();
  final ProductDao _productDao = ProductDao();

  List<CategoryModel> get categories => _categories;
  List<BannerModel> get banners => _banners;
  List<ProductModel> get products => _products;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchHomeData() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      // Fetch categories from the API
      _categories = (await _apiService.fetchCategories());
      // _categoryDao.insertCategory(_categories as CategoryModel);

      // Fetch banners from the API
      _banners = await _apiService.fetchBanners();
      // _bannerDao.insertBanner(_banners as BannerModel);

      // Fetch products from the API
      _products = await _apiService.fetchProducts();
      // _productDao.insertProduct(_products as Product);
    } catch (e) {
      _error = e.toString();
      try {
        // Fetch categories, banners, and products from the local database if an error occurs
        _categories = await _categoryDao.getCategories();
        _banners = await _bannerDao.getBanners();
        _products = await _productDao.getProducts();
      } catch (dbError) {
        _error = "dbError.toString()";
      }
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
