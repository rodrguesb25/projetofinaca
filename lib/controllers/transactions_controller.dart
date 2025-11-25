import '../models/transaction_model.dart';


class TransactionsController {
List<TransactionModel> transactions = [
TransactionModel(title: 'Mercado', amount: 120.0, date: '01/01/2025', category: 'Alimentação', isExpense: true),
TransactionModel(title: 'Salário', amount: 3000.0, date: '01/01/2025', category: 'Receita', isExpense: false),
TransactionModel(title: 'Conta de luz', amount: 120.0, date: '02/01/2025', category: 'Casa', isExpense: true),
];
}