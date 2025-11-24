import '../models/transaction_model.dart';

class DashboardController {
  double getTotalReceitas(List<TransactionModel> trans) {
    return trans
        .where((t) => t.value > 0)
        .fold(0, (sum, t) => sum + t.value);
  }

  double getTotalDespesas(List<TransactionModel> trans) {
    return trans
        .where((t) => t.value < 0)
        .fold(0, (sum, t) => sum + t.value.abs());
  }

  Map<String, double> getDespesasPorCategoria(List<TransactionModel> trans) {
    final mapa = <String, double>{};

    for (var t in trans.where((e) => e.value < 0)) {
      mapa[t.category] = (mapa[t.category] ?? 0) + t.value.abs();
    }

    return mapa;
  }
}
