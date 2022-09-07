import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/utilities/network_info.dart';
import 'models/required_data.dart';
import 'notifiers/required_data.dart';

final requireDataProvider =
    StateNotifierProvider<RequireDataNotifier, NetworkInfo<CompanyRequiredData>>(
        (ref) => RequireDataNotifier());