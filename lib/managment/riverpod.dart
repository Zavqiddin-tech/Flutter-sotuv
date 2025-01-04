import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/riverpod_model.dart';

final riverpodEasyLevel = StateProvider<int>((ref) {
  return 0;
});

final riverpodHardLevel = ChangeNotifierProvider<RiverpodModel>((ref) {
  final model = RiverpodModel();
  model.getAllUser();
  return model;
});
