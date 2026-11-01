import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  FirestoreRepository({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> collection(String name) => _firestore.collection(name);

  Future<void> addRestaurant(Map<String, dynamic> data) => collection('restaurants').add(data);
  Stream<QuerySnapshot<Map<String, dynamic>>> restaurants() => collection('restaurants').snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> orders() => collection('orders').snapshots();
}
