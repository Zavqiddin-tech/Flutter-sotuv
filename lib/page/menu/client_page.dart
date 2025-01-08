import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sotuv/managment/client/client_riverpod.dart';
import 'package:intl/intl.dart';

class ClientPage extends ConsumerWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(clientRiverpod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mijozlar',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 2,
      ),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: model.allClient.length,
              itemBuilder: (context, index) {
                final item = model.allClient[index];
                final DateTime createAt = DateTime.parse(item['createAt']);
                final String formattedDate =
                    DateFormat('dd-MM-yyyy').format(createAt);

                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                            Chip(
                              label: const Text(
                                'Mijoz',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          '${item['fName']} ${item['lName']}',
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 18.0),
                            const SizedBox(width: 4.0),
                            Text(
                              "${item['phoneOne']} | ${item['phoneTwo']}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 18.0),
                            const SizedBox(width: 4.0),
                            Text(
                              '@${item['createdBy']['userName']}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
