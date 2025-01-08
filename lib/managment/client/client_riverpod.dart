import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/client/client_model.dart';


final clientRiverpod = ChangeNotifierProvider<ClientRiverpodModel>((ref) {
  final model = ClientRiverpodModel();
  model.getAllClient();
  return model;
});
