import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/auth/auth_model.dart';

final authRiverpod = ChangeNotifierProvider<AuthRiverpodModel>((ref) {
  final model = AuthRiverpodModel();
  model.checkUser();
  return model;
});
