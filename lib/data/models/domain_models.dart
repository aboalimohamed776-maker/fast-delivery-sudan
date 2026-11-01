enum PaymentMethod { cash, bankak }

enum OrderStatus { pending, accepted, pickedUp, delivered, cancelled }

class Captain {
  const Captain({required this.name, required this.phone, required this.bankakAccount, required this.bankakName, this.subscriptionEnd, this.debt = 0, this.isApproved = false});
  final String name;
  final String phone;
  final String bankakAccount;
  final String bankakName;
  final DateTime? subscriptionEnd;
  final double debt;
  final bool isApproved;
}

class Order {
  const Order({required this.toAddress, required this.fee, required this.commission10, required this.phone, this.captainId, required this.status, required this.paymentMethod});
  final String toAddress;
  final double fee;
  final double commission10;
  final String phone;
  final String? captainId;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
}

class RechargeCode {
  const RechargeCode({required this.code, required this.days, required this.price, this.isUsed = false});
  final String code;
  final int days;
  final double price;
  final bool isUsed;
}
