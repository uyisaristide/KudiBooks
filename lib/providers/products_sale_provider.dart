import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/product_sale_model.dart';

final productSaleProvider =
    ChangeNotifierProvider((ref) => ProductSalesProvider());

class ProductSalesProvider extends ChangeNotifier {
  final List<ProductSalesModel> _productsaleList = [];

  List<ProductSalesModel> get productSalesList => _productsaleList;

  addNewSale(ProductSalesModel productSale) {
    _productsaleList.add(productSale);
    notifyListeners();
  }

  removeSale(int saleId) {
    _productsaleList.removeWhere((element) => element.saleId == saleId);
    notifyListeners();
  }
}

// class InventoryProviders extends ChangeNotifier {
//   final List<InventoryModel> _listInventory = [];

//   List<InventoryModel> get allInventories => _listInventory;

//   addInventory(InventoryModel inventoryModel) {
//     _listInventory.add(inventoryModel);
//     notifyListeners();
//   }

//   removeInventory(int inventoryId) {
//     _listInventory.removeWhere((element) => element.id == inventoryId);
//     notifyListeners();
//   }
// }
