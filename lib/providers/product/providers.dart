import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/product/item_to_sell_details.dart';
import '../../models/product/product_sell_model.dart';
import '../../models/product/required_data_product.dart';
import '../../models/product/retrive_product_model.dart';
import '../../models/product/unit_measure.dart';
import '../../models/utilities/network_info.dart';
import 'list_products.dart';
import 'product_notifier.dart';
import 'product_to_sell_details_notifier.dart';
import 'required_data.dart';
import 'unit_of_measure.dart';

//Products
final productToSellRequiredDataProvider = StateNotifierProvider<ProductRequiredData, NetworkInfo<RequiredDataProduct>>((ref) => ProductRequiredData());
final createProductProvider = StateNotifierProvider<ProductNotifier, NetworkInfo<List<ProductSellModel>>>((ref) => ProductNotifier());
final allProductProvider = StateNotifierProvider<RetrieveProductNotifier, NetworkInfo<List<RetrieveProductModel>>>((ref) => RetrieveProductNotifier());
final productToSellDetailsProvider = StateNotifierProvider<ProductToSellDetailsNotifier, NetworkInfo<ItemToSellDetails>>((ref) => ProductToSellDetailsNotifier());

//Measure
final unitMeasureProvider = StateNotifierProvider<UnitMeasureNotifier, NetworkInfo<List<UnitsOfMeasureModel>>>((ref) => UnitMeasureNotifier());
final createUnitMeasureProvider = StateNotifierProvider<UnitMeasureNotifier, NetworkInfo<List<UnitsOfMeasureModel>>>((ref) => UnitMeasureNotifier());
final removeMeasureProvider = StateNotifierProvider<UnitMeasureNotifier, NetworkInfo<List<UnitsOfMeasureModel>>>((ref) => UnitMeasureNotifier());