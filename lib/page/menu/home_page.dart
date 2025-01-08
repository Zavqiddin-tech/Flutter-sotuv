import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sotuv/managment/home/home_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(homeRiverpod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Uylar',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 2,
      ),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.allHome.length,
              itemBuilder: (context, index) {
                final item = model.allHome[index];
                final DateTime createAt = DateTime.parse(item['createAt']);
                final String formattedDate =
                    DateFormat('dd-MM-yyyy HH:mm').format(createAt);

                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Uy bandligi
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  item['isBusy'] ? Icons.lock : Icons.lock_open,
                                  color: item['isBusy']
                                      ? Colors.red
                                      : Colors.green,
                                  size: 20,
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  item['isBusy'] ? 'Band' : 'Ochiq',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: item['isBusy']
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),

                        // Uy nomi
                        Text(
                          item['home'],
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),

                        // Uy xonalari soni
                        Row(
                          children: [
                            const Icon(
                              Icons.house,
                              size: 18,
                              color: Colors.blueGrey,
                            ),
                            const SizedBox(width: 8.0),
                            Text(
                              '${item['count']} - xonalik',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),

                        // Detallar
                        Text(
                          item['detail'],
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 4.0),

                        // Kim tomonidan qo'shilgan
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 16.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '@${item['createdBy']['userName']}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
