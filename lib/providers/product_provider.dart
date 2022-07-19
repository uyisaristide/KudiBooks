import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _listProducts = [];
  final List<ProductInLoadModel> _productLoadModel = [];

  

  List<ProductModel> get allProducts => _listProducts;

  List<ProductInLoadModel> get allToLoadModel => _productLoadModel;

  addProduct(ProductModel productModel) {
    _listProducts.add(productModel);
    notifyListeners();
  }

  addProductToInventory(ProductInLoadModel productInLoadModel) {
    _productLoadModel.add(productInLoadModel);
    notifyListeners();
  }

  removeLoadInModel(int idLoadModel) {
    _productLoadModel
        .removeWhere((element) => element.productId == idLoadModel);
  }

  removeProduct(int productId) {
    _listProducts.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
