import 'package:flutter/material.dart';
import '../core/firebase/firebase_bootstrap.dart';

enum AppFlavor { customer, captain, admin }

class FastDeliveryApp extends StatelessWidget {
  const FastDeliveryApp({super.key, required this.flavor});
  final AppFlavor flavor;

  String get title => switch (flavor) {
        AppFlavor.customer => 'Fast Delivery Sudan · Customer',
        AppFlavor.captain => 'Fast Delivery Sudan · Captain',
        AppFlavor.admin => 'Fast Delivery Sudan · Admin',
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xff0b6b4b), useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text('Day 1 foundation · ${flavor.name}')),
      ),
    );
  }
}

Future<void> bootstrapFirebase() => FirebaseBootstrap.initialize();
