class BannerSingleModel {
  final String id;
  final String title;
  final String imageUrl;

  BannerSingleModel({required this.id, required this.title, required this.imageUrl});

  factory BannerSingleModel.fromJson(Map<String, dynamic> json) {
    return BannerSingleModel(
      id: json['id'],
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image_url': imageUrl,
    };
  }

  factory BannerSingleModel.fromMap(Map<String, dynamic> map) {
    return BannerSingleModel(
      id: map['id'],
      title: map['title'],
      imageUrl: map['image_url'],
    );
  }
}
