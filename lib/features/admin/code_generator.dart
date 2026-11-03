import 'dart:math';

class RechargeCodeDraft {
  const RechargeCodeDraft({required this.code, required this.days, required this.price, required this.country});
  final String code;
  final int days;
  final int price;
  final String country;

  Map<String, Object> toFirestore() => {'code': code, 'days': days, 'price': price, 'country': country, 'is_used': false};
}

class RechargeCodeGenerator {
  static RechargeCodeDraft generate() {
    final code = (100000 + Random.secure().nextInt(900000)).toString();
    return RechargeCodeDraft(code: code, days: 30, price: 5000, country: 'SD');
  }
}
