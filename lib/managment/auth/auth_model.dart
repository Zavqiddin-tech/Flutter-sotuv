import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRiverpodModel extends ChangeNotifier {
  final secureStorage = FlutterSecureStorage();
  bool isLoading = true;
  final dioInstance = dio.Dio(); // Prefiks qo‘llanildi
  bool isAuthorized = false; // Foydalanuvchini autentifikatsiya holati

  AuthRiverpodModel();

  Future<void> checkUser() async {
    final token = await secureStorage.read(key: 'auth_token');
    try {
      final res = await dioInstance.get(
        'http://192.168.118.118:8000/api/auth/checkuser',
        options: dio.Options(headers: {
          'Authorization': "Bearer $token"
        }),
      );

      if (res.statusCode == 200) {
        isAuthorized = true;
        isLoading = false;
      } else if (res.statusCode == 401) {
        isAuthorized = false;
        isLoading = false;
      }
    } catch (e) {
      print('Error checking user: $e');
      isAuthorized = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login(String userName, String password) async {
    try {
      final res = await dioInstance.post('http://192.168.118.118:8000/api/auth/login', data: {
        'userName': userName,
        'password': password
      });

      if (res.statusCode == 201) {
        print(res.data['accessToken']);
        await secureStorage.write(key: 'auth_token', value: res.data['accessToken']);
        isAuthorized = true;
        isLoading = false;
      } else if (res.statusCode == 401) {
        isAuthorized = false;
        isLoading = false;
      }
    } catch (e) {
      print('Error checking user: $e');
      isAuthorized = false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
