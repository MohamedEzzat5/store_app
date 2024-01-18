class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;
  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.category,
  });

  factory ProductModel.fromJson(jsonData){
    return ProductModel(
      id: jsonData ['id'],
      title: jsonData ['title'],
      image: jsonData ['image'],
      description: jsonData ['description'],
      price: jsonData ['price'],
      category: jsonData['category'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}


class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData){
    return RatingModel(
      count: jsonData['count'],
      rate: jsonData['rate'],
    );
  }
}

