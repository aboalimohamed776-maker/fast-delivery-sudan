import 'package:flutter/material.dart';
import '../../app/zoolfast_theme.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});
  @override Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: const Text('ZoolFast Admin · Port Sudan')),
    body: ListView(padding: const EdgeInsets.all(24), children: [
      Wrap(spacing: 16, runSpacing: 16, children: const [
        _Metric(title: 'Total orders today', value: '0', icon: Icons.receipt_long),
        _Metric(title: 'Active captains', value: '0', icon: Icons.two_wheeler),
        _Metric(title: 'Revenue', value: '0 SDG', icon: Icons.payments),
      ]),
      const SizedBox(height: 24),
      const Text('Live map · Port Sudan · Pin #3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Container(height: 280, color: Colors.blueGrey.shade100, child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.location_pin, color: ZoolFastTheme.redPin, size: 48), Text('Map integration placeholder · Realtime Database ready')]))),
      const SizedBox(height: 24),
      const Text('Orders management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const ListTile(leading: Icon(Icons.location_pin, color: ZoolFastTheme.redPin), title: Text('No orders yet'), subtitle: Text('Pending · Accepted · Delivered')),
      const Divider(),
      const Text('Captains management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const ListTile(leading: Icon(Icons.person), title: Text('No captains yet'), subtitle: Text('Approve / block / view live location')),
      const Divider(),
      const Text('Restaurants management', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      const ListTile(leading: Icon(Icons.restaurant), title: Text('Port Sudan restaurants'), subtitle: Text('Add and edit restaurants')),
    ],
  );
}

class _Metric extends StatelessWidget {
  const _Metric({required this.title, required this.value, required this.icon});
  final String title; final String value; final IconData icon;
  @override Widget build(BuildContext context) => SizedBox(width: 220, child: Card(child: ListTile(leading: Icon(icon, color: ZoolFastTheme.yellow), title: Text(title), subtitle: Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)))));
}
