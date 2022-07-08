import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _listProducts = [];

  // ProductProvider _productProvider = Provider.of<ProductProvider>(BuildContext contexts);

  List<ProductModel> get allProducts => _listProducts;

  addProduct(ProductModel productModel) {
    _listProducts.add(productModel);
    notifyListeners();
  }

  removeProduct(int productId) {
    _listProducts.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
