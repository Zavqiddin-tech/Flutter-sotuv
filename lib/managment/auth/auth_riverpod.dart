import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/auth/auth_model.dart';

final authRiverpod = ChangeNotifierProvider<RiverpodModel>((ref) {
  final model = RiverpodModel();
  model.checkUser();
  return model;
});
