import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/api/api.dart';

class MonitoringRiverpodModel extends ChangeNotifier {
  List<dynamic> allPay = [];
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final Dio dio = Dio();

  MonitoringRiverpodModel();

  Future<void> getAllPay(int id) async {
    notifyListeners();
    final token = await secureStorage.read(key: 'auth_token');
    try {
      // Backenddan ma'lumotlarni olib kelish
      final res = await dio.get('${apiBaseUrl}/sale/monitoring/all/$id',
          options: Options(headers: {'Authorization': "Bearer $token"}));
      if (res.statusCode == 200 && res.data is List) {
        allPay = res.data;
        print(allPay);
        if (allPay.isNotEmpty) {
          isLoading = false;
          print(allPay);
        }
      }
    } catch (e) {
      print('Error fetching initial data: $e');
    } finally {
      notifyListeners();
    }
  }
}
