import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RiverpodModel extends ChangeNotifier {
  bool isLoading = true;
  final Dio dio = Dio();
  bool isAuthorized = false; // Foydalanuvchini autentifikatsiya holati

  RiverpodModel();

  Future<void> checkUser() async {
    try {
      final response =
          await dio.get('http://192.168.143.18:3000/api/auth/checkuser',
              options: Options(headers: {
                'Authorization':
                    "Bearer"
              }));

      print(response);

      if (response.statusCode == 200) {
        isAuthorized = true;
        isLoading = false;
      } else if (response.statusCode == 401) {
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
