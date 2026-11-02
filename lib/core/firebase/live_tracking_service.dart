import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

class LiveTrackingService {
  LiveTrackingService({FirebaseDatabase? database}) : _database = database ?? FirebaseDatabase.instance;
  final FirebaseDatabase _database;
  Timer? _timer;

  DatabaseReference orderRef(String orderId) => _database.ref('orders/$orderId');

  Stream<DatabaseEvent> watchOrder(String orderId) => orderRef(orderId).onValue;

  Future<void> updateCaptainLocation({required String captainId, required String orderId, required double lat, required double lng}) async {
    final payload = {'lat': lat, 'lng': lng, 'timestamp': ServerValue.timestamp};
    await _database.ref('captains/$captainId/location').set(payload);
    await orderRef(orderId).child('captainLocation').set(payload);
  }

  Future<void> setOrderStatus(String orderId, String status) => orderRef(orderId).child('status').set(status);

  void startLocationUpdates({required String captainId, required String orderId, required double lat, required double lng}) {
    _timer?.cancel();
    updateCaptainLocation(captainId: captainId, orderId: orderId, lat: lat, lng: lng);
    _timer = Timer.periodic(const Duration(seconds: 10), (_) => updateCaptainLocation(captainId: captainId, orderId: orderId, lat: lat, lng: lng));
  }

  void stopLocationUpdates() => _timer?.cancel();
}
