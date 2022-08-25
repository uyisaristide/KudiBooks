import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/Users/ProductInLoad.dart';
import '../models/Users/products_sold_model.dart';
import '../models/product_model.dart';

class ProductProvider extends StateNotifier<List<ProductModel>> {
  ProductProvider() : super([]);

  addProduct(ProductModel productModel) {
    state = [...state, productModel];
  }

  removeProduct(int productId) {
    state = state
        .where((currentProduct) => currentProduct.id != productId)
        .toList();
  }
}

class ProductInLoadProvider extends StateNotifier<List<ProductInLoadModel>> {
  ProductInLoadProvider() : super([]);
  addProductToInventory(ProductInLoadModel productInLoadModel) {
    state = [...state, productInLoadModel];
  }

  removeLoadInModel(int loadId) {
    state = state
        .where(
            (productInLoad) => productInLoad.productId != loadId)
        .toList();
  }
}

class AddProductToSalesNotifier extends StateNotifier<List<ProductToSell>> {
  AddProductToSalesNotifier() : super([]);
  addProductToSales(ProductToSell productToSell) {
    state = [...state, productToSell];
  }

  removeProductToSales(int productTosellId) {
    state = state
        .where((deleteSell) => deleteSell.productId != productTosellId)
        .toList();
  }
}
