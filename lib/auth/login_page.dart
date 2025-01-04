import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sotuv/ui/my_button.dart';
import 'package:sotuv/ui/my_textfield.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // storage
  final secureStorage = FlutterSecureStorage();

  // login method
  final Dio dio = Dio();
  void login() async {
    try {
      // Body uchun ma'lumotlar
      final body = {
        "userName": emailController.text, // o'zingizning username ni qo'ying
        "password": passwordController.text, // o'zingizning password ni qo'ying
      };
      print(body);
      // So'rovni yuborish
      final res = await dio.post(
        'http://192.168.143.18:3000/api/auth/login',
        data: body, // Bodyni shu yerda yuborasiz
      );

      // Javobni tekshirish
      if (res.statusCode == 201) {
        // Login muvaffaqiyatli bo'lsa
        Navigator.pushNamed(context, '/hard_page');
        print(res.data);
      } else {
        // Login muvaffaqiyatsiz bo'lsa
        Navigator.pushNamed(context, '/login_page');
      }
    } catch (e) {
      // Xatoliklarni ushlash
      print('Error: $e');
      Navigator.pushNamed(context, '/login_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // logo
                    Icon(
                      Icons.person,
                      size: 80,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // app name
                    const Text(
                      "M I N I M A L",
                      style: TextStyle(fontSize: 20),
                    ),

                    const SizedBox(
                      height: 50,
                    ),

                    // email textfield
                    MyTextfield(
                        hintText: "Email",
                        obscureText: false,
                        controller: emailController),

                    const SizedBox(
                      height: 10,
                    ),

                    // password textfield
                    MyTextfield(
                        hintText: "Password",
                        obscureText: true,
                        controller: passwordController),

                    const SizedBox(
                      height: 10,
                    ),

                    // forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // sign in button
                    MyButton(text: "Login", onTap: login),

                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
