import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/client_list_model.dart';
import '../../../models/client_models/client_model.dart';
import '../../../models/client_models/client_stats.dart';
import '../../../models/utilities/network_info.dart';
import '../notifiers/all_clients.dart';
import '../notifiers/client_details.dart';
import '../notifiers/client_provider.dart';
import '../notifiers/client_stats.dart';

final clientProvider = StateNotifierProvider<AllClientsNotifier, NetworkInfo<List<Clients>>>((ref) => AllClientsNotifier());
final createClientProvider = StateNotifierProvider<ClientNotifier, NetworkInfo<List<ClientModel>>>((ref) => ClientNotifier());
final editClientProvider = StateNotifierProvider<ClientNotifier, NetworkInfo<List<ClientModel>>>((ref) => ClientNotifier());
final removeClientProvider = StateNotifierProvider<ClientNotifier, NetworkInfo<List<ClientModel>>>((ref) => ClientNotifier());
final clientDetails = StateNotifierProvider<ClientDetailsNotifier, NetworkInfo<ClientModel?>>((ref) => ClientDetailsNotifier());
final clientStatsProvider = StateNotifierProvider<ClientStatsNotifier, NetworkInfo<ClientStatistics>>((ref) => ClientStatsNotifier());