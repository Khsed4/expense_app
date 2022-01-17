
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime dateTime;

  Transaction({
    required this.dateTime,
    required this.id,
    required this.title,
    required this.amount,
  });
}
