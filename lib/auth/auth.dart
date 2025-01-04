import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/auth/auth_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(authRiverpod);

    if (model.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Yo'naltirishni bu yerda qiling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (model.isAuthorized) {
        Navigator.pushNamed(context, '/hard_page');
      } else {
        Navigator.pushNamed(context, '/login_page');
      }
    });

    return const SizedBox.shrink();
  }
}
