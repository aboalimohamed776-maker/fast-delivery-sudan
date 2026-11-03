import 'package:cloud_firestore/cloud_firestore.dart';

class CaptainSubscriptionService {
  CaptainSubscriptionService({FirebaseFirestore? firestore}) : _firestore = firestore ?? FirebaseFirestore.instance;
  final FirebaseFirestore _firestore;

  Future<bool> redeemSudanCode({required String captainId, required String code}) async {
    final query = await _firestore.collection('recharge_codes').where('code', isEqualTo: code).where('country', isEqualTo: 'SD').where('is_used', isEqualTo: false).limit(1).get();
    if (query.docs.isEmpty) return false;
    final codeRef = query.docs.first.reference;
    final captainRef = _firestore.collection('captains').doc(captainId);
    return _firestore.runTransaction((transaction) async {
      final codeSnapshot = await transaction.get(codeRef);
      if (!codeSnapshot.exists || codeSnapshot.data()?['is_used'] == true) return false;
      final days = (codeSnapshot.data()?['days'] as num?)?.toInt() ?? 30;
      final captainSnapshot = await transaction.get(captainRef);
      final current = captainSnapshot.data()?['subscription_end'];
      final currentEnd = current is Timestamp ? current.toDate() : DateTime.now();
      final start = currentEnd.isAfter(DateTime.now()) ? currentEnd : DateTime.now();
      transaction.update(codeRef, {'is_used': true, 'used_by': captainId, 'used_at': FieldValue.serverTimestamp()});
      transaction.set(captainRef, {'subscription_end': Timestamp.fromDate(start.add(Duration(days: days)),), 'country': 'SD', 'currency': 'SDG'}, SetOptions(merge: true));
      return true;
    });
  }

  bool isExpired(DateTime? subscriptionEnd) => subscriptionEnd == null || subscriptionEnd.isBefore(DateTime.now());
}
