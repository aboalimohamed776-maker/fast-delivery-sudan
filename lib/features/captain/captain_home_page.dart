import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/zoolfast_theme.dart';
import '../../core/firebase/live_tracking_service.dart';

class CaptainHomePage extends StatefulWidget {
  const CaptainHomePage({super.key});
  @override State<CaptainHomePage> createState() => _CaptainHomePageState();
}

class _CaptainHomePageState extends State<CaptainHomePage> {
  final tracking = LiveTrackingService();
  String status = 'Pending';
  final orderId = 'demo-order-001';
  final captainId = 'demo-captain-001';

  Future<void> openNavigation() async {
    final uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=${ZoolFastTheme.portSudan.lat},${ZoolFastTheme.portSudan.lng}');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void updateStatus(String value) {
    setState(() => status = value);
    tracking.setOrderStatus(orderId, value);
    if (value == 'Picked up' || value == 'On the way') {
      tracking.startLocationUpdates(captainId: captainId, orderId: orderId, lat: ZoolFastTheme.portSudan.lat, lng: ZoolFastTheme.portSudan.lng);
    } else if (value == 'Delivered') {
      tracking.stopLocationUpdates();
    }
  }

  @override Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey.shade100,
    appBar: AppBar(backgroundColor: ZoolFastTheme.black, foregroundColor: ZoolFastTheme.yellow, title: const Text('ZoolFast Captain')),
    body: ListView(padding: const EdgeInsets.all(16), children: [
      Card(child: ListTile(leading: const Icon(Icons.location_pin, color: ZoolFastTheme.redPin), title: const Text('طلب جديد · Port Sudan'), subtitle: const Text('العنوان: حي المطار، بورتسودان\nالإجمالي: 12,500 SDG\nالمسافة: ضمن 5 كم'), trailing: Text(status))),
      const SizedBox(height: 12),
      Wrap(spacing: 8, runSpacing: 8, children: [
        ElevatedButton(onPressed: () => updateStatus('Accepted'), child: const Text('Accept Order')),
        OutlinedButton(onPressed: () => updateStatus('Rejected'), child: const Text('Reject Order')),
        OutlinedButton(onPressed: openNavigation, child: const Text('Navigation')),
      ]),
      const SizedBox(height: 16),
      const Text('تقدم الطلب', style: TextStyle(fontWeight: FontWeight.bold)),
      SegmentedButton<String>(segments: const [ButtonSegment(value: 'Picked up', label: Text('Picked up')), ButtonSegment(value: 'On the way', label: Text('On the way')), ButtonSegment(value: 'Delivered', label: Text('Delivered'))], selected: {status == 'Pending' || status == 'Accepted' ? 'Picked up' : status}, onSelectionChanged: (s) => updateStatus(s.first)),
      const SizedBox(height: 24),
      Card(child: const ListTile(title: Text('أرباح اليوم'), subtitle: Text('0 SDG · 0 deliveries'), leading: Icon(Icons.payments, color: ZoolFastTheme.yellow))),
    ]),
  );
}
