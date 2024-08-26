import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/category.dart';
import '../../models/banner.dart';
import '../../models/product.dart';
import '../../models/single_banner.dart';

class ApiService {
  final String baseUrl = 'https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo';

  Future<List<CategoryModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);

      // Filter for 'catagories' type and convert to CategoryModel
      var categoryDataList = data
          .where((element) => element['type'] == 'catagories')
          .map((categoryJson) => CategoryModel.fromJson(categoryJson))
          .toList();
      print(categoryDataList.length);
      return categoryDataList;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<BannerModel>> fetchBanners() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .where((element) => element['type'] == 'banner_slider')
          .map((bannerJson) => BannerModel.fromJson(bannerJson))
          .toList();
    } else {
      throw Exception('Failed to load banners');
    }
  }

  Future<List<BannerSingleModel>> fetchSingleBanners() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data
          .where((element) => element['type'] == 'banner_single')
          .map((bannerJson) => BannerSingleModel.fromJson(bannerJson))
          .toList();
    } else {
      throw Exception('Failed to load single banners');
    }
  }

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      var products = data
          .where((element) => element['type'] == 'products')
          .map((e) => ProductModel.fromJson(e))
          .toList();
      print(products[0].contents);
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
