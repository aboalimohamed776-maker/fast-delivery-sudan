enum PaymentMethod { cash, bankak, visa, master, applePay, mada, tabby }
enum OrderStatus { pending, accepted, pickedUp, delivered, cancelled, paid }

class Captain {
  const Captain({required this.name, required this.phone, required this.bankakAccount, required this.bankakName, this.subscriptionEnd, this.debt = 0, this.isApproved = false, this.country = 'SD', this.currency = 'SDG', this.iban, this.totalEarnings = 0, this.totalCommissionPaid = 0});
  final String name, phone, bankakAccount, bankakName, country, currency;
  final DateTime? subscriptionEnd;
  final double debt, totalEarnings, totalCommissionPaid;
  final bool isApproved;
  final String? iban;
}

class Order {
  const Order({required this.toAddress, required this.fee, required this.commission10, required this.phone, this.captainId, required this.status, required this.paymentMethod, this.country = 'SD', this.currency = 'SDG', this.commission15 = 0, this.captainEarning85 = 0, this.paymentGateway, this.paymentId});
  final String toAddress, phone, country, currency;
  final double fee, commission10, commission15, captainEarning85;
  final String? captainId, paymentGateway, paymentId;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
}

class RechargeCode {
  const RechargeCode({required this.code, required this.days, required this.price, this.isUsed = false, this.country = 'SD'});
  final String code, country;
  final int days;
  final double price;
  final bool isUsed;
}
