class ProductModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  final double rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      rating: (json['rating']['rate'] as num).toDouble(),
    );
  }
}
