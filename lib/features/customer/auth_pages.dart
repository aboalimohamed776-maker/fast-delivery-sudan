import 'package:flutter/material.dart';

import '../../app/zoolfast_theme.dart';
import '../../services/auth_service.dart';

String? validatePhone(String? value) {
  if (value == null || !RegExp(r'^\d{10}$').hasMatch(value.trim())) return 'رقم الهاتف يجب أن يتكون من 10 أرقام';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) return 'كلمة السر يجب ألا تقل عن 6 أحرف';
  return null;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.auth, required this.onAuthenticated, required this.onSignup});
  final AuthService auth;
  final ValueChanged<AuthUser> onAuthenticated;
  final VoidCallback onSignup;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool busy = false;
  bool obscure = true;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => busy = true);
    final user = await widget.auth.signIn(phone: phoneController.text.trim(), password: passwordController.text);
    if (!mounted) return;
    setState(() => busy = false);
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('رقم الهاتف أو كلمة السر غير صحيحة')));
    } else {
      widget.onAuthenticated(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 34),
            const Icon(Icons.bolt, color: ZoolFastTheme.yellow, size: 64),
            const Text('ZoolFast', textAlign: TextAlign.center, style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900)),
            const SizedBox(height: 8),
            const Text('تسجيل الدخول', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Column(children: [
                TextFormField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'رقم الهاتف', prefixIcon: Icon(Icons.phone), border: OutlineInputBorder()), validator: validatePhone),
                const SizedBox(height: 14),
                TextFormField(controller: passwordController, obscureText: obscure, decoration: InputDecoration(labelText: 'كلمة السر', prefixIcon: const Icon(Icons.lock), suffixIcon: IconButton(onPressed: () => setState(() => obscure = !obscure), icon: Icon(obscure ? Icons.visibility : Icons.visibility_off)), border: const OutlineInputBorder()), validator: validatePassword),
                Align(alignment: AlignmentDirectional.centerEnd, child: TextButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('سيتم تفعيل استعادة كلمة السر مع Firebase Auth'))), child: const Text('نسيت كلمة السر؟'))),
                const SizedBox(height: 8),
                SizedBox(width: double.infinity, height: 52, child: FilledButton(style: FilledButton.styleFrom(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow), onPressed: busy ? null : submit, child: busy ? const CircularProgressIndicator() : const Text('دخول', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)))),
              ]),
            ),
            const SizedBox(height: 18),
            OutlinedButton(onPressed: widget.onSignup, child: const Text('إنشاء حساب جديد')),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.auth, required this.onAuthenticated, required this.onLogin});
  final AuthService auth;
  final ValueChanged<AuthUser> onAuthenticated;
  final VoidCallback onLogin;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool busy = false;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => busy = true);
    final user = await widget.auth.signUp(name: nameController.text.trim(), phone: phoneController.text.trim(), password: passwordController.text);
    if (!mounted) return;
    setState(() => busy = false);
    widget.onAuthenticated(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: const Text('إنشاء حساب')),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(padding: const EdgeInsets.all(24), children: [
            const Text('حساب جديد في ZoolFast', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            const SizedBox(height: 20),
            TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'الاسم الكامل', prefixIcon: Icon(Icons.person), border: OutlineInputBorder()), validator: (v) => v == null || v.trim().isEmpty ? 'اكتب الاسم الكامل' : null),
            const SizedBox(height: 14),
            TextFormField(controller: phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(labelText: 'رقم الهاتف', prefixIcon: Icon(Icons.phone), border: OutlineInputBorder()), validator: validatePhone),
            const SizedBox(height: 14),
            TextFormField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'كلمة السر', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder()), validator: validatePassword),
            const SizedBox(height: 14),
            TextFormField(controller: confirmController, obscureText: true, decoration: const InputDecoration(labelText: 'تأكيد كلمة السر', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder()), validator: (v) => v != passwordController.text ? 'كلمتا السر غير متطابقتين' : null),
            const SizedBox(height: 22),
            SizedBox(height: 52, child: FilledButton(style: FilledButton.styleFrom(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow), onPressed: busy ? null : submit, child: busy ? const CircularProgressIndicator() : const Text('إنشاء حساب', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)))),
            TextButton(onPressed: widget.onLogin, child: const Text('لديك حساب؟ تسجيل الدخول')),
          ]),
        ),
      ),
    );
  }
}
