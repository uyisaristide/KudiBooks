import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/utilities/network_info.dart';
import '../../models/vendor_model.dart';
import 'vendor_details_notifier.dart';
import 'vendor_notifier.dart';

final allVendorsProvider = StateNotifierProvider<VendorNotifier, NetworkInfo<List<VendorModel>>>((ref) => VendorNotifier());
final editVendorProvider = StateNotifierProvider<VendorNotifier, NetworkInfo<List<VendorModel>>>((ref) => VendorNotifier());
final vendorDetailsProvider = StateNotifierProvider<VendorDetailsNotifier, NetworkInfo<VendorModel>>((ref) => VendorDetailsNotifier());