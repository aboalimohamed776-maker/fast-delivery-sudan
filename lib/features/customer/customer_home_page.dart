import 'package:flutter/material.dart';

import '../../app/zoolfast_theme.dart';
import '../../core/constants/countries.dart';
import '../../core/constants/country_preferences.dart';
import '../../data/models/restaurant.dart';
import '../../services/auth_service.dart';
import '../../services/restaurant_service.dart';
import 'founder_card_page.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key, required this.user, required this.auth, required this.onSignedOut});
  final AuthUser user;
  final AuthService auth;
  final VoidCallback onSignedOut;

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int tab = 0;
  ZoolCountry selected = Countries.all.first;
  late Future<List<Restaurant>> restaurantsFuture;

  @override
  void initState() {
    super.initState();
    restaurantsFuture = _loadRestaurants();
    _loadCountry();
  }

  Future<void> _loadCountry() async {
    final value = await CountryPreferences.load();
    if (mounted) setState(() => selected = value);
  }

  Future<List<Restaurant>> _loadRestaurants() async {
    try {
      return await RestaurantService().fetchRestaurants();
    } catch (_) {
      // Firebase can be connected later without changing this UI.
      return const [];
    }
  }

  Future<void> _changeCountry(ZoolCountry? value) async {
    if (value == null) return;
    await CountryPreferences.save(value);
    if (mounted) setState(() => selected = value);
  }

  Future<void> _logout() async {
    await widget.auth.signOut();
    if (mounted) widget.onSignedOut();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _home(context),
      const _OrdersTab(),
      const _CartTab(),
      _account(context),
    ];
    return Scaffold(
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) => setState(() => tab = value),
        indicatorColor: ZoolFastTheme.yellow.withOpacity(.6),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'الرئيسية'),
          NavigationDestination(icon: Icon(Icons.receipt_long_outlined), selectedIcon: Icon(Icons.receipt_long), label: 'الطلبات'),
          NavigationDestination(icon: Icon(Icons.shopping_cart_outlined), selectedIcon: Icon(Icons.shopping_cart), label: 'السلة'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }

  Widget _home(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => setState(() => restaurantsFuture = _loadRestaurants()),
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Row(children: [
            const Icon(Icons.bolt, color: ZoolFastTheme.yellow, size: 42),
            const SizedBox(width: 8),
            const Expanded(child: Text('ZoolFast', style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900))),
            DropdownButton<ZoolCountry>(value: selected, underline: const SizedBox(), items: Countries.all.map((country) => DropdownMenuItem(value: country, child: Text('${country.flag} ${country.currency}'))).toList(), onChanged: _changeCountry),
          ]),
          const SizedBox(height: 20),
          Text('مرحباً ${widget.user.name}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 5),
          Text('كل احتياجاتك من ${selected.name} · ${selected.currency}', style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 24),
          const Text('التصنيفات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10, children: const [
            _Category(icon: Icons.restaurant, title: 'مطاعم'),
            _Category(icon: Icons.shopping_basket, title: 'سوبرماركت'),
            _Category(icon: Icons.local_pharmacy, title: 'صيدلية'),
            _Category(icon: Icons.grass, title: 'خضار'),
            _Category(icon: Icons.account_balance_wallet, title: 'بنكك تحويل'),
            _Category(icon: Icons.payments, title: 'كاش'),
          ]),
          const SizedBox(height: 26),
          const Text('مطاعم قريبة منك', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          FutureBuilder<List<Restaurant>>(
            future: restaurantsFuture,
            builder: (context, snapshot) {
              final restaurants = snapshot.data ?? const <Restaurant>[];
              if (restaurants.isEmpty) return const Card(child: Padding(padding: EdgeInsets.all(18), child: Text('لا توجد مطاعم حالياً - ستتم إضافتها من لوحة تحكم المدير')));
              return Column(children: restaurants.map((restaurant) => _RestaurantTile(restaurant: restaurant)).toList());
            },
          ),
        ],
      ),
    );
  }

  Widget _account(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(18), children: [
      const Icon(Icons.person, size: 76, color: ZoolFastTheme.yellow),
      const Text('حسابي', textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
      const SizedBox(height: 18),
      Card(child: ListTile(leading: const Icon(Icons.person_outline), title: Text(widget.user.name), subtitle: Directionality(textDirection: TextDirection.ltr, child: Text(widget.user.phone, textAlign: TextAlign.right)))),
      const SizedBox(height: 8),
      ListTile(leading: const Icon(Icons.badge_outlined), title: const Text('بطاقة المؤسس'), trailing: const Icon(Icons.chevron_left), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const FounderCardPage()))),
      ListTile(leading: const Icon(Icons.language), title: const Text('الدولة والعملة'), trailing: Text('${selected.flag} ${selected.currency}')),
      const SizedBox(height: 18),
      OutlinedButton.icon(onPressed: _logout, icon: const Icon(Icons.logout), label: const Text('تسجيل الخروج')),
    ]);
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) => Card(color: ZoolFastTheme.yellow.withOpacity(.16), elevation: 0, child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, color: ZoolFastTheme.black, size: 29), const SizedBox(height: 5), Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))]));
}

class _RestaurantTile extends StatelessWidget {
  const _RestaurantTile({required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) => Card(child: ListTile(leading: restaurant.image.isEmpty ? const Icon(Icons.restaurant) : Image.network(restaurant.image, width: 52, height: 52, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const Icon(Icons.restaurant)), title: Text(restaurant.name), subtitle: Text('⭐ ${restaurant.rating} · ${restaurant.deliveryTime}'), trailing: Text(restaurant.isOpen ? 'مفتوح' : 'مغلق', style: TextStyle(color: restaurant.isOpen ? Colors.green : Colors.red, fontWeight: FontWeight.bold))));
}

class _OrdersTab extends StatelessWidget {
  const _OrdersTab();
  @override
  Widget build(BuildContext context) => const Center(child: Text('لا توجد طلبات بعد'));
}

class _CartTab extends StatelessWidget {
  const _CartTab();
  @override
  Widget build(BuildContext context) => const Center(child: Text('السلة فارغة'));
}
