class StoreModel {
  final String name;
  final String description;
  final String image;
  final double rating;

  StoreModel({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      rating: map['rating'] != null
          ? double.tryParse(map['rating'].toString()) ?? 0.0
          : 0.0,
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      "rating": rating.toString(),
    };
  }
}
