import 'package:expiret/models/product_model.dart';
import 'package:expiret/services/data_service.dart';

class ProductRepository {
  final DataService _dataService = DataService();

  Future<List<Product>> getAllProducts() async {
    List<Map<String, dynamic>> data =
        await _dataService.getRequest('products/get/all');
    return data.map((e) => Product.fromJson(e)).toList();
  }

  void getProductsOrderedBy(List<Product> products, [Order? odrder]) {
    switch (odrder) {
      case Order.price:
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case Order.discount:
        products.sort((a, b) => a.discount.compareTo(b.discount));
        break;
      case Order.likes:
        products.sort((a, b) => a.likes.length.compareTo(b.likes.length));
        break;
      case Order.quantity:
        products.sort((a, b) => a.quantity.compareTo(b.quantity));
        break;
      case Order.views:
        products.sort((a, b) => a.views.compareTo(b.views));
        break;
      case Order.expireDate:
        products.sort((a, b) => a.expireDate.compareTo(b.expireDate));
        break;
      default:
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
    }
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    List<Map<String, dynamic>> data =
        await _dataService.getRequest('products/get/$category');
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getProductsByUserId(String id) async {
    List<Map<String, dynamic>> data =
        await _dataService.getRequest('products/get/user/$id');
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<String> deleteProduct(String id) async {
    Map<String, dynamic> data =
        await _dataService.deleteRequest('products/remove', {'id': id});
    return data['message'];
  }

  Future<String> addProduct(Product product) async {
    Map<String, dynamic> data =
        await _dataService.postRequest('products/add', product.toJson());
    return data['message'];
  }

  Future<String> editProduct(Product product) async {
    Map<String, dynamic> data =
        await _dataService.putRequest('products/edit', product.toJson());
    return data['message'];
  }
}

enum Order {
  price,
  expireDate,
  views,
  quantity,
  discount,
  likes,
}
