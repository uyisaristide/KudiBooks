import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/client_model.dart';

final clientProvider = StateNotifierProvider<ClientProvider, List<ClientModel>>(
    (ref) => ClientProvider());

class ClientProvider extends StateNotifier<List<ClientModel>> {
  ClientProvider() : super([]);

  addClient(ClientModel clientModel) {
    state = [...state, clientModel];
  }
}
