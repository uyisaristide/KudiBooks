import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/Users/ProductInLoad.dart';
import 'package:kudibooks_app/models/Users/products_sold_model.dart';
import 'package:kudibooks_app/models/product_model.dart';

//Product provider
final productProviders =
    StateNotifierProvider<ProductProvider, List<ProductModel>>(
        (ref) => ProductProvider());

//Product In Load provider
final productInLoadProviders =
    StateNotifierProvider<ProductInLoadProvider, List<ProductInLoadModel>>(
        (ref) => ProductInLoadProvider());

//Product to sell provider

final productToSell =
    StateNotifierProvider<ProductToSellProvider, List<ProductToSell>>(
        (ref) => ProductToSellProvider());

class ProductProvider extends StateNotifier<List<ProductModel>> {
  ProductProvider() : super([]);
  static ProductProvider productProviderInstance = ProductProvider();

  addProduct(ProductModel productModel) {
    state = [...state, productModel];
  }

  removeProduct(int productId) {
    state.removeWhere((element) => element.id == productId);
  }
}

class ProductToSellProvider extends StateNotifier<List<ProductToSell>> {
  ProductToSellProvider() : super([]);

  addProductToSales(ProductToSell productToSell) {
    state = [...state, productToSell];
  }

  removeProductToSales(int productTosell) {
    state.removeWhere((element) => element.productId == productTosell);
  }
}

class ProductInLoadProvider extends StateNotifier<List<ProductInLoadModel>> {
  ProductInLoadProvider() : super([]);

  addProductToInventory(ProductInLoadModel productInLoadModel) {
    state = [...state, productInLoadModel];
  }

  removeLoadInModel(int idLoadModel) {
    state.removeWhere((element) => element.productId == idLoadModel);
  }
}
