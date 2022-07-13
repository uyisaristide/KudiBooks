import 'package:flutter/material.dart';
import 'package:kudibooks_app/models/inventory_model.dart';

class InventoryProviders extends ChangeNotifier {
  final List<InventoryModel> _listInventory = [];

  List<InventoryModel> get allInventories => _listInventory;

  addInventory(InventoryModel inventoryModel) {
    _listInventory.add(inventoryModel);
    notifyListeners();
  }

  removeInventory(int inventoryId) {
    _listInventory.removeWhere((element) => element.id == inventoryId);
    notifyListeners();
  }
}
