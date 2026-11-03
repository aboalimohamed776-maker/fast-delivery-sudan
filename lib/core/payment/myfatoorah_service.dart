import 'dart:convert';
import 'package:http/http.dart' as http;

class MyFatoorahService {
  MyFatoorahService({http.Client? client, String? apiToken}) : _client = client ?? http.Client(), _apiToken = apiToken ?? const String.fromEnvironment('MYFATOORAH_API_TOKEN');
  final http.Client _client;
  final String _apiToken;
  static const _baseUrl = 'https://apitest.myfatoorah.com/v2';

  Future<Map<String, dynamic>> createPayment({required double amount, required String currency, required String customerPhone}) async {
    if (_apiToken.isEmpty) {
      throw StateError('MYFATOORAH_API_TOKEN is not configured. Pass it with --dart-define.');
    }
    final response = await _client.post(Uri.parse('$_baseUrl/SendPayment'), headers: {'Authorization': 'Bearer $_apiToken', 'Content-Type': 'application/json'}, body: jsonEncode({'NotificationOption': 'LNK', 'InvoiceValue': amount, 'CurrencyIso': currency, 'CustomerMobile': customerPhone}));
    if (response.statusCode < 200 || response.statusCode >= 300) throw StateError('MyFatoorah error ${response.statusCode}: ${response.body}');
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
