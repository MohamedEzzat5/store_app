import '../helper/api.dart';
import '../models/product_model.dart';
import 'package:http/http.dart' as http;

class UpdateProductService{
  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required int id,
    required String category,
  }) async {
    print('product id =$id');
    Map<String,dynamic>data =await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}