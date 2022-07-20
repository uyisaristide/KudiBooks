import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/client_model.dart';

class ClientProvider extends ChangeNotifier {
  List<ClientModel> _clientList = [];

  List<ClientModel> get allClients => _clientList;
  static final ClientProvider clientInstance = ClientProvider();

  //static ClientProvider get clientInstances => _clientInstance;

  addClient(ClientModel clientModel) {
    _clientList.add(clientModel);
    notifyListeners();
  }
}
