import 'countries.dart';

class Pricing {
  static const sudanRechargePrice = 5000;
  static const gulfCommissionRate = 0.15;

  static double commissionFor(ZoolCountry country, double total) => country.isSudan ? 0 : total * gulfCommissionRate;
  static double captainEarningFor(ZoolCountry country, double total) => country.isSudan ? total : total * (1 - gulfCommissionRate);
}
