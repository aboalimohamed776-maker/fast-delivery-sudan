import 'package:flutter/material.dart';
import '../core/firebase/firebase_bootstrap.dart';
import 'zoolfast_theme.dart';

enum AppFlavor { customer, captain, admin }

class FastDeliveryApp extends StatelessWidget {
  const FastDeliveryApp({super.key, required this.flavor});
  final AppFlavor flavor;

  String get title => switch (flavor) {
        AppFlavor.customer => 'ZoolFast · Customer',
        AppFlavor.captain => 'ZoolFast · Captain',
        AppFlavor.admin => 'ZoolFast · Admin',
      };

  @override Widget build(BuildContext context) => MaterialApp(
    title: title,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: ZoolFastTheme.yellow, scaffoldBackgroundColor: Colors.white, useMaterial3: true),
    home: Scaffold(appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: Text(title)), body: Center(child: Text('ZoolFast · ${flavor.name}'))),
  );
}

Future<void> bootstrapFirebase() => FirebaseBootstrap.initialize();
