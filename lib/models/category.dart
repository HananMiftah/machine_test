class CategoryContent {
  final String title;
  final String imageUrl;

  CategoryContent({required this.title, required this.imageUrl});

  factory CategoryContent.fromJson(Map<String, dynamic> json) {
    return CategoryContent(
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image_url': imageUrl,
    };
  }

  factory CategoryContent.fromMap(Map<String, dynamic> map) {
    return CategoryContent(
      title: map['title'],
      imageUrl: map['image_url'],
    );
  }
}

class CategoryModel {
  final String id;
  final String title;
  final List<CategoryContent> contents;

  CategoryModel({required this.id, required this.title, required this.contents});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'] ?? '',
      contents: (json['contents'] as List)
          .map((contentJson) => CategoryContent.fromJson(contentJson))
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

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      title: map['title'],
      contents: (map['contents'] as List)
          .map((contentMap) => CategoryContent.fromMap(contentMap))
          .toList(),
    );
  }
}
