import 'package:flutter/material.dart';
import '../../app/zoolfast_theme.dart';
import '../../core/constants/countries.dart';
import '../../core/constants/country_preferences.dart';
import '../../core/payment/payment_factory.dart';

class CountrySelectorPage extends StatefulWidget {
  const CountrySelectorPage({super.key});
  @override State<CountrySelectorPage> createState() => _CountrySelectorPageState();
}

class _CountrySelectorPageState extends State<CountrySelectorPage> {
  ZoolCountry selected = Countries.all.first;
  bool loading = true;

  @override void initState() { super.initState(); _load(); }
  Future<void> _load() async { final value = await CountryPreferences.load(); if (mounted) setState(() { selected = value; loading = false; }); }
  Future<void> _change(ZoolCountry? value) async { if (value == null) return; await CountryPreferences.save(value); if (mounted) setState(() => selected = value); }

  @override Widget build(BuildContext context) {
    if (loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: const Text('ZoolFast')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        const Text('اختر الدولة', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('سيتم استخدام العملة وطريقة الدفع الخاصة بالدولة المختارة.'),
        const SizedBox(height: 20),
        DropdownButtonFormField<ZoolCountry>(value: selected, decoration: const InputDecoration(labelText: 'الدولة', border: OutlineInputBorder()), items: Countries.all.map((country) => DropdownMenuItem(value: country, child: Text('${country.flag}  ${country.name} · ${country.currency}'))).toList(), onChanged: _change),
        const SizedBox(height: 20),
        Card(child: ListTile(leading: Text(selected.flag, style: const TextStyle(fontSize: 30)), title: Text('مثال السعر: 100 ${selected.symbol}'), subtitle: Text('المدن: ${selected.cities.join('، ')}\nنموذج الدفع: ${selected.isSudan ? 'أكواد / كاش / بنكك' : 'عمولة 15% + MyFatoorah'}'))),
        const SizedBox(height: 16),
        FilledButton(onPressed: () async { final result = await PaymentFactory.forCountry(selected).checkout(amount: 100, currency: selected.currency, customerPhone: '0000000000', method: selected.isSudan ? 'cash' : 'visa'); if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment flow: ${result['payment_gateway']}'))); }, child: const Text('متابعة إلى الدفع التجريبي')),
        const SizedBox(height: 18),
        Container(height: 220, color: Colors.blueGrey.shade100, child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.location_pin, color: ZoolFastTheme.redPin, size: 52), Text('خريطة ${selected.cities.first} · Pin #3')]))),
      ]),
    );
  }
}
