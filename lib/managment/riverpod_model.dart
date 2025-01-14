import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/api/api.dart';

class RiverpodModel extends ChangeNotifier {
  List<dynamic> allUser = [];
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final Dio dio = Dio();

  RiverpodModel();

  Future<void> getAllUser() async {
    notifyListeners();
    final token = await secureStorage.read(key: 'auth_token');
    try {
      // Backenddan ma'lumotlarni olib kelish
      final response =
          await dio.get('${apiBaseUrl}/sale/client/all',
              options: Options(headers: {
                'Authorization':
                    "Bearer $token"
              }));
      if (response.statusCode == 200 && response.data is List) {
        allUser = response.data;
        if (allUser.isNotEmpty) {
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
