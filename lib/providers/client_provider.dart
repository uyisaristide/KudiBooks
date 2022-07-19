import 'package:flutter/cupertino.dart';
import 'package:kudibooks_app/models/client_model.dart';

class ClientProvider extends ChangeNotifier{
  List<ClientModel> _clientList = [];
  List<ClientModel> get allClients => _clientList;
  
}