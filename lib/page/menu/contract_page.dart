import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sotuv/managment/contract/contract_riverpod.dart';

class ContractPage extends ConsumerWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(contractRiverpod);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shartnoma',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 2,
      ),
      body: model.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.allContract.length,
              itemBuilder: (context, index) {
                final item = model.allContract[index];
                final DateTime createAt = DateTime.parse(item['createAt']);
                final String formattedDate =
                    DateFormat('dd-MM-yyyy').format(createAt);
                final paid = NumberFormat.decimalPattern().format(item['paid']);
                final price =
                    NumberFormat.decimalPattern().format(item['price']);
                final qoldiq = NumberFormat.decimalPattern()
                    .format(item['price'] - item['paid']);
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: item['price'] == item['paid']
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'uy: ${item['home']['home']}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'narxi: ${price.toString()}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "to'landi: ${paid.toString()}",
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                      Text(
                        "qarz: ${qoldiq.toString()}",
                        style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.red),
                      ),
                      Text(
                        item['detail'],
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
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
                      const SizedBox(height: 4.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/monitoring_page',
                                arguments: {'routeId': item['id']});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Tugma foni rangi
                            foregroundColor: Colors.white, // Matn rangi
                          ),
                          child: const Text('Batafsil'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
