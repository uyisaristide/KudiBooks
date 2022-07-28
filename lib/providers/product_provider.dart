import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/Users/products_sold_model.dart';
import 'package:kudibooks_app/models/product_model.dart';

final productProviders = ChangeNotifierProvider((ref) => ProductProvider());

class ProductProvider extends ChangeNotifier {
  final List<ProductModel> _listProducts = [];
  final List<ProductInLoadModel> _productLoadModel = [];
  static ProductProvider productProviderInstance = ProductProvider();

  final List<ProductToSell> _productToSell = [];

  List<ProductModel> get allProducts => _listProducts;

  List<ProductInLoadModel> get allToLoadModel => _productLoadModel;

  List<ProductToSell> get allOnSaleList => _productToSell;

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

  addProductToSales(ProductToSell productToSell) {
    _productToSell.add(productToSell);
    notifyListeners();
  }

  removeProductToSales(int productTosell) {
    _productToSell.removeWhere((element) => element.productId == productTosell);
    notifyListeners();
  }
}
