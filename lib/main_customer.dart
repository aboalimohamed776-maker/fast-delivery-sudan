import 'package:flutter/material.dart';

import 'app/zoolfast_theme.dart';
import 'features/customer/auth_pages.dart';
import 'features/customer/customer_home_page.dart';
import 'services/auth_service.dart';

void main() => runApp(const ZoolFastCustomerApp());

class ZoolFastCustomerApp extends StatefulWidget {
  const ZoolFastCustomerApp({super.key});

  @override
  State<ZoolFastCustomerApp> createState() => _ZoolFastCustomerAppState();
}

class _ZoolFastCustomerAppState extends State<ZoolFastCustomerApp> {
  final auth = AuthService();
  AuthUser? user;
  bool loading = true;
  bool showSignup = false;

  @override
  void initState() {
    super.initState();
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    final savedUser = await auth.currentUser();
    if (mounted) setState(() { user = savedUser; loading = false; });
  }

  void _authenticated(AuthUser value) => setState(() { user = value; showSignup = false; });
  void _signedOut() => setState(() => user = null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZoolFast Customer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: ZoolFastTheme.yellow, scaffoldBackgroundColor: Colors.white, useMaterial3: true, fontFamily: 'Arial'),
      builder: (context, child) => Directionality(textDirection: TextDirection.rtl, child: child!),
      home: loading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : user == null
              ? (showSignup
                  ? SignupPage(auth: auth, onAuthenticated: _authenticated, onLogin: () => setState(() => showSignup = false))
                  : LoginPage(auth: auth, onAuthenticated: _authenticated, onSignup: () => setState(() => showSignup = true)))
              : CustomerHomePage(user: user!, auth: auth, onSignedOut: _signedOut),
    );
  }
}
