import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/api/api.dart';

class HomeRiverpodModel extends ChangeNotifier {
  List<dynamic> allHome= [];
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final Dio dio = Dio();

  HomeRiverpodModel();

  Future<void> getAllHome() async {
    notifyListeners();
    final token = await secureStorage.read(key: 'auth_token');
    try {
      // Backenddan ma'lumotlarni olib kelish
      final res =
          await dio.get('${apiBaseUrl}/sale/home/all',
              options: Options(headers: {
                'Authorization':
                    "Bearer $token"
              }));
      if (res.statusCode == 200 && res.data is List) {
        allHome = res.data;
        if (allHome.isNotEmpty) {
          isLoading = false;
          print(allHome);
        }
      }
    } catch (e) {
      print('Error fetching initial data: $e');
    } finally {
      notifyListeners();
    }
  }
}