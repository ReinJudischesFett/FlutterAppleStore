import 'package:apple_store/data/product_model.dart';

class DataBase {
  final List<Product> _productList = [
    Product(
      'Iphone 14 pro max',
      1299,
      'https://res.cloudinary.com/shufersal/image/upload/f_auto,q_auto/v1551800922/prod/product_images/products_zoom/ION46_Z_P_7290106708600_1.png',
      'iphone',
    ),
    
  ];
  List<Product> get productList => _productList;
}
