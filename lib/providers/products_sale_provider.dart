import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/product_sale_model.dart';

final productSaleProvider =
    StateNotifierProvider<ProductSalesProvider, List<ProductSalesModel>>(
        (ref) => ProductSalesProvider());

class ProductSalesProvider extends StateNotifier<List<ProductSalesModel>> {
  ProductSalesProvider() : super([]);

  addNewSale(ProductSalesModel productSale) {
    state = [...state, productSale];
  }

  removeSale(int saleId) {
    state.removeWhere((element) => element.saleId == saleId);
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
