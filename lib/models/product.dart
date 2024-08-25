class ProductContent {
  final String sku;
  final String productName;
  final String productImage;
  final int productRating;
  final String actualPrice;
  final String offerPrice;
  final String discount;

  ProductContent({
    required this.sku,
    required this.productName,
    required this.productImage,
    required this.productRating,
    required this.actualPrice,
    required this.offerPrice,
    required this.discount,
  });

  factory ProductContent.fromJson(Map<String, dynamic> json) {
    return ProductContent(
      sku: json['sku'] ?? '',
      productName: json['product_name'] ?? '',
      productImage: json['product_image'] ?? '',
      productRating: json['product_rating'] ?? 0,
      actualPrice: json['actual_price'] ?? '',
      offerPrice: json['offer_price'] ?? '',
      discount: json['discount'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'product_name': productName,
      'product_image': productImage,
      'product_rating': productRating,
      'actual_price': actualPrice,
      'offer_price': offerPrice,
      'discount': discount,
    };
  }

  factory ProductContent.fromMap(Map<String, dynamic> map) {
    return ProductContent(
      sku: map['sku'],
      productName: map['product_name'],
      productImage: map['product_image'],
      productRating: map['product_rating'],
      actualPrice: map['actual_price'],
      offerPrice: map['offer_price'],
      discount: map['discount'],
    );
  }
}

class ProductModel {
  final String id;
  final String title;
  final List<ProductContent> contents;

  ProductModel({
    required this.id,
    required this.title,
    required this.contents,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      contents: (json['contents'] as List)
          .map((contentJson) => ProductContent.fromJson(contentJson))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'contents': contents.map((content) => content.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      contents: (map['contents'] as List)
          .map((contentMap) => ProductContent.fromMap(contentMap))
          .toList(),
    );
  }
}
