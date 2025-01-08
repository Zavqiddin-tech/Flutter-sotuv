import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/home/home_model.dart';


final homeRiverpod = ChangeNotifierProvider<HomeRiverpodModel>((ref) {
  final model = HomeRiverpodModel();
  model.getAllHome();
  return model;
});
