class Transaction {
  final String? transactionId;
  final String? transactionTitle;
  final double? transactionAmount;
  final DateTime transactionDateTime;
  final bool? spent;
  const Transaction(
      {required this.transactionId,
      required this.transactionTitle,
      required this.spent,
      required this.transactionAmount,
      required this.transactionDateTime});
}
