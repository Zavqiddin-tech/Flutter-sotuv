import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/riverpod.dart';

class HardPage extends ConsumerWidget {
  const HardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(riverpodHardLevel);

    return Scaffold(
      appBar: AppBar(title: const Text('Hard Page')),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.allUser.length,
              itemBuilder: (context, index) {
                final item = model.allUser[index];
                return ListTile(
                  title: Text(item['fName'].toString()),
                );
              },
            ),
    );
  }
}
