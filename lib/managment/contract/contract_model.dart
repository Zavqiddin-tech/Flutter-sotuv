import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/api/api.dart';

class ContractRiverpodModel extends ChangeNotifier {
  List<dynamic> allContract = [];
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final Dio dio = Dio();

  ContractRiverpodModel();

  Future<void> getAllContract() async {
    notifyListeners();
    final token = await secureStorage.read(key: 'auth_token');
    try {
      // Backenddan ma'lumotlarni olib kelish
      final res =
          await dio.get('${apiBaseUrl}/sale/contract/all',
              options: Options(headers: {
                'Authorization':
                    "Bearer $token"
              }));
      if (res.statusCode == 200 && res.data is List) {
        allContract = res.data;
        if (allContract.isNotEmpty) {
          isLoading = false;
          print(allContract);
        }
      }
    } catch (e) {
      print('Error fetching initial data: $e');
    } finally {
      notifyListeners();
    }
  }
}