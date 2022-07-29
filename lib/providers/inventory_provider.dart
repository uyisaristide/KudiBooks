import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/inventory_model.dart';

final inventoryProvider =
    StateNotifierProvider<InventoryProviders, List<InventoryModel>>(
        (ref) => InventoryProviders());

class InventoryProviders extends StateNotifier<List<InventoryModel>> {
  InventoryProviders() : super([]);

  addInventory(InventoryModel inventoryModel) {
    state = [...state, inventoryModel];
  }

  removeInventory(int inventoryId) {
    state.removeWhere((element) => element.id == inventoryId);
  }
}
