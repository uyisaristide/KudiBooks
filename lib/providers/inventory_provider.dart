import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/inventory_model.dart';

class InventoryProviders extends StateNotifier<List<InventoryModel>> {
  InventoryProviders() : super([]);

  addInventory(InventoryModel inventoryModel) {
    state = [...state, inventoryModel];
  }

  removeInventory(int inventoryId) {
    state.removeWhere((element) => element.id == inventoryId);
  }
}



 