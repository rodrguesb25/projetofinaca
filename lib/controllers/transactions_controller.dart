import '../models/transaction_model.dart';

class TransactionsController {
  List<TransactionModel> transacoes = [];

  // Exemplo de carregamento mockado
  void carregarTransacoes() {
    transacoes = [
      TransactionModel(
        title: "Amigo",
        subtitle: "Alimentação | Caixa",
        value: -30.0,
        category: "Alimentação",
        date: DateTime(2025, 11, 5),
        color: 0xFFE53935,
      ),
      TransactionModel(
        title: "Pizza",
        subtitle: "Alimentação | Caixa",
        value: -30.0,
        category: "Alimentação",
        date: DateTime(2025, 11, 5),
        color: 0xFFE53935,
      ),
      TransactionModel(
        title: "TV (4/10)",
        subtitle: "Casa | Caixa",
        value: -200.0,
        category: "Casa",
        date: DateTime(2025, 11, 5),
        color: 0xFF1E88E5,
      ),
      TransactionModel(
        title: "IPTU",
        subtitle: "Casa | Carteira",
        value: -76.0,
        category: "Casa",
        date: DateTime.now(),
        color: 0xFFE53935,
      ),
    ];
  }

  List<TransactionModel> getByDate(DateTime date) {
    return transacoes
        .where((t) =>
            t.date.day == date.day &&
            t.date.month == date.month &&
            t.date.year == date.year)
        .toList();
  }
}
