import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/contract/contract_model.dart';


final contractRiverpod = ChangeNotifierProvider<ContractRiverpodModel>((ref) {
  final model = ContractRiverpodModel();
  model.getAllContract();
  return model;
});
