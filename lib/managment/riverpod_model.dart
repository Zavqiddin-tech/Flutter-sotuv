import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RiverpodModel extends ChangeNotifier {
  List<dynamic> allUser = [];
  bool isLoading = true;
  final Dio dio = Dio();

  RiverpodModel();

  Future<void> getAllUser() async {
    notifyListeners();
    try {
      // Backenddan ma'lumotlarni olib kelish
      final response =
          await dio.get('http://192.168.240.18:3000/api/sale/client/all',
              options: Options(headers: {
                'Authorization':
                    "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTmFtZSI6InphdnFpIiwic3ViIjoyOSwiaWF0IjoxNzM1OTI0MzU2LCJleHAiOjE3MzU5MjU1NTZ9.Wioo9eIVRTzoYxz-NnhXyZjjv9Z9DmwgZkQg8uhyvSo"
              }));
      if (response.statusCode == 200 && response.data is List) {
        allUser = response.data;
        if (allUser.isNotEmpty) {
          isLoading = false;
          print(allUser);
        }
      }
    } catch (e) {
      print('Error fetching initial data: $e');
    } finally {
      notifyListeners();
    }
  }
}
