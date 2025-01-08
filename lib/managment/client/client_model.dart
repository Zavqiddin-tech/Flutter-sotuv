import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/api/api.dart';

class ClientRiverpodModel extends ChangeNotifier {
  List<dynamic> allClient = [];
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final Dio dio = Dio();

  ClientRiverpodModel();

  Future<void> getAllClient() async {
    notifyListeners();
    final token = await secureStorage.read(key: 'auth_token');
    try {
      // Backenddan ma'lumotlarni olib kelish
      final res =
          await dio.get('${apiBaseUrl}/sale/client/all',
              options: Options(headers: {
                'Authorization':
                    "Bearer $token"
              }));
      if (res.statusCode == 200 && res.data is List) {
        allClient = res.data;
        if (allClient.isNotEmpty) {
          isLoading = false;
        }
      }
    } catch (e) {
      print('Error fetching initial data: $e');
    } finally {
      notifyListeners();
    }
  }
}