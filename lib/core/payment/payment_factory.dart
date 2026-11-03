import '../constants/countries.dart';
import 'myfatoorah_service.dart';

enum SudanPaymentMethod { cash, bankak }
enum GulfPaymentMethod { visa, master, applePay, mada, tabby }

abstract class ZoolPaymentProvider {
  Future<Map<String, dynamic>> checkout({required double amount, required String currency, required String customerPhone, String? method});
}

class CashBankakPayment implements ZoolPaymentProvider {
  @override Future<Map<String, dynamic>> checkout({required double amount, required String currency, required String customerPhone, String? method}) async => {'payment_gateway': 'cash_bankak', 'payment_method': method ?? 'cash', 'status': 'pending', 'amount': amount, 'currency': currency};
}

class MyFatoorahPayment implements ZoolPaymentProvider {
  MyFatoorahPayment([MyFatoorahService? service]) : _service = service ?? MyFatoorahService();
  final MyFatoorahService _service;
  @override Future<Map<String, dynamic>> checkout({required double amount, required String currency, required String customerPhone, String? method}) async {
    final result = await _service.createPayment(amount: amount, currency: currency, customerPhone: customerPhone);
    return {...result, 'payment_gateway': 'myfatoorah', 'payment_method': method ?? 'visa', 'status': 'paid'};
  }
}

class PaymentFactory {
  static ZoolPaymentProvider forCountry(ZoolCountry country) => country.isSudan ? CashBankakPayment() : MyFatoorahPayment();
}
