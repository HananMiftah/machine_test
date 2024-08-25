class BannerContent {
  final String title;
  final String imageUrl;

  BannerContent({required this.title, required this.imageUrl});

  factory BannerContent.fromJson(Map<String, dynamic> json) {
    return BannerContent(
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

  factory BannerContent.fromMap(Map<String, dynamic> map) {
    return BannerContent(
      title: map['title'],
      imageUrl: map['image_url'],
    );
  }
}

class BannerModel {
  final String id;
  final String title;
  final List<BannerContent> contents;

  BannerModel({required this.id, required this.title, required this.contents});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'] ?? '',
      contents: (json['contents'] as List)
          .map((contentJson) => BannerContent.fromJson(contentJson))
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

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'],
      title: map['title'],
      contents: (map['contents'] as List)
          .map((contentMap) => BannerContent.fromMap(contentMap))
          .toList(),
    );
  }
}
