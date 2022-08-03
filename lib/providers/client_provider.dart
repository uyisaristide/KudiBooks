
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudibooks_app/models/client_model.dart';

class ClientNotifier extends StateNotifier<List<ClientModel>> {
  ClientNotifier() : super([]);

  addClient(ClientModel clientModel) {
    state = [...state, clientModel];
  }
}
