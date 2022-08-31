import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product/required_data_product.dart';
import '../../models/utilities/network_info.dart';
import 'required_data.dart';

final productToSellRequiredDataProvider = StateNotifierProvider<ProductRequiredData, NetworkInfo<RequiredDataProduct>>((ref) => ProductRequiredData());