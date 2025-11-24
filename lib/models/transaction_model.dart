class TransactionModel {
  final String title;
  final String subtitle;
  final double value;
  final String category;
  final DateTime date;
  final int color;

  TransactionModel({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.category,
    required this.date,
    required this.color,
  });
}
