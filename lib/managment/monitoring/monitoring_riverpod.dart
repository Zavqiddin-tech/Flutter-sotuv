import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/monitoring/monitoring_model.dart';

final monitoringRiverpod =
    ChangeNotifierProvider<MonitoringRiverpodModel>((ref) {
  return MonitoringRiverpodModel();
});
