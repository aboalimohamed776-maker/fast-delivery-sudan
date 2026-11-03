enum PaymentModel { rechargeCodes, commission15Percent }

class ZoolCountry {
  const ZoolCountry({required this.code, required this.name, required this.currency, required this.symbol, required this.paymentModel, required this.flag, required this.cities, required this.latitude, required this.longitude});
  final String code;
  final String name;
  final String currency;
  final String symbol;
  final PaymentModel paymentModel;
  final String flag;
  final List<String> cities;
  final double latitude;
  final double longitude;

  bool get isSudan => code == 'SD';
}

class Countries {
  static const all = <ZoolCountry>[
    ZoolCountry(code: 'SD', name: 'السودان', currency: 'SDG', symbol: 'جنيه', paymentModel: PaymentModel.rechargeCodes, flag: '🇸🇩', cities: ['Port Sudan', 'Khartoum'], latitude: 19.6158, longitude: 37.2164),
    ZoolCountry(code: 'SA', name: 'السعودية', currency: 'SAR', symbol: 'ر.س', paymentModel: PaymentModel.commission15Percent, flag: '🇸🇦', cities: ['Riyadh', 'Jeddah'], latitude: 24.7136, longitude: 46.6753),
    ZoolCountry(code: 'EG', name: 'مصر', currency: 'EGP', symbol: 'ج.م', paymentModel: PaymentModel.commission15Percent, flag: '🇪🇬', cities: ['Cairo', 'Alexandria'], latitude: 30.0444, longitude: 31.2357),
    ZoolCountry(code: 'AE', name: 'الإمارات', currency: 'AED', symbol: 'د.إ', paymentModel: PaymentModel.commission15Percent, flag: '🇦🇪', cities: ['Dubai', 'Sharjah'], latitude: 25.2048, longitude: 55.2708),
    ZoolCountry(code: 'QA', name: 'قطر', currency: 'QAR', symbol: 'ر.ق', paymentModel: PaymentModel.commission15Percent, flag: '🇶🇦', cities: ['Doha'], latitude: 25.2854, longitude: 51.5310),
  ];

  static ZoolCountry byCode(String code) => all.firstWhere((country) => country.code == code, orElse: () => all.first);
}
