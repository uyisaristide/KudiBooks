import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product/product_model.dart';
import 'class_to_mock.dart';

class ProductToMockNotifier extends StateNotifier<List<ProductModel>> {
  ProductToMockNotifier() : super([]);
  getDummyList() {
    var productsList = DummyProducts.products;
    state = productsList;
  }
}

final dummyProductsList =
    StateNotifierProvider<ProductToMockNotifier, List<ProductModel>>(
        (ref) => ProductToMockNotifier());
