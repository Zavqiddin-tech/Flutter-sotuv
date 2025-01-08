import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sotuv/managment/monitoring/monitoring_riverpod.dart';

class MonitoringPage extends ConsumerWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(monitoringRiverpod);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = args['routeId'];

    if (model.isLoading) {
      model.getAllPay(id);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("To'lov Monitoring", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 2,
      ),
      body: model.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: model.allPay.length,
              itemBuilder: (context, index) {
                final item = model.allPay[index];
                final DateTime createAt = DateTime.parse(item['createAt']);
                final String formattedDate =
                    DateFormat('dd-MM-yyyy HH:mm').format(createAt);
                final amount = NumberFormat.decimalPattern().format(item['amount']);
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
                        // To'lov qilingan sana
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
                            Text(
                              '${amount} UZS',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),

                        // To'lovning detallar
                        Text(
                          item['detail'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4.0),

                        // To'lovni kim amalga oshirgan
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
