import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sotuv/components/my_drawer.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Statik hisobot ma'lumotlari
    final int uySoni = 15;
    final int mijozSoni = 7;
    final tulov = NumberFormat.decimalPattern().format(74000000);
    final qarzdorlik = NumberFormat.decimalPattern().format(36000000);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'W A L L',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 ustun
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildCard(
                    context,
                    title: 'Uylar soni',
                    value: uySoni.toString(),
                    icon: Icons.home,
                    color: Colors.blue,
                  ),
                  _buildCard(
                    context,
                    title: 'Mijozlar soni',
                    value: mijozSoni.toString(),
                    icon: Icons.people,
                    color: Colors.green,
                  ),
                  _buildCard(
                    context,
                    title: 'To\'lov',
                    value: "${tulov.toString()} UZS",
                    icon: Icons.attach_money,
                    color: Colors.purple,
                  ),
                  _buildCard(
                    context,
                    title: 'Qarzdorlik',
                    value: "${qarzdorlik.toString()} UZS",
                    icon: Icons.warning_amber,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.2), color.withOpacity(0.7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withOpacity(0.3),
            child: Icon(icon, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
