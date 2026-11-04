import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/zoolfast_theme.dart';

class FounderCardPage extends StatelessWidget {
  const FounderCardPage({super.key});

  static const phone = '+249 124 058 142';
  static const email = 'aboali.mohamed776@gmail.com';

  Future<void> open(Uri uri, BuildContext context) async {
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تعذر فتح التطبيق')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: const Text('بطاقة المؤسس')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.asset('assets/images/founder_card.png', width: double.infinity, fit: BoxFit.contain)),
          const SizedBox(height: 18),
          const Text('Abu Ali Mohamed', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
          const SizedBox(height: 5),
          const Text('Founder & CEO - المؤسس والمدير التنفيذي', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('من السوق لحد باب بيتك', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 16),
          Directionality(textDirection: TextDirection.ltr, child: Column(children: [
            SelectableText(phone, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            SelectableText(email, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
          ])),
          const SizedBox(height: 18),
          Wrap(alignment: WrapAlignment.center, spacing: 8, runSpacing: 8, children: [
            FilledButton.icon(onPressed: () => open(Uri.parse('tel:+249124058142'), context), icon: const Icon(Icons.phone), label: const Text('اتصل الآن')),
            FilledButton.icon(onPressed: () => open(Uri.parse('https://wa.me/249124058142'), context), icon: const Icon(Icons.chat), label: const Text('واتساب')),
            OutlinedButton.icon(onPressed: () => open(Uri.parse('mailto:$email'), context), icon: const Icon(Icons.email), label: const Text('إيميل')),
          ]),
        ],
      ),
    );
  }
}
