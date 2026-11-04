import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/models/restaurant.dart';

class RestaurantService {
  RestaurantService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Stream<List<Restaurant>> watchRestaurants() {
    return _firestore.collection('restaurants').snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => Restaurant.fromFirestore(doc.id, doc.data())).toList(),
        );
  }

  Future<List<Restaurant>> fetchRestaurants() async {
    final snapshot = await _firestore.collection('restaurants').get();
    return snapshot.docs.map((doc) => Restaurant.fromFirestore(doc.id, doc.data())).toList();
  }
}
