import '../models/category_model.dart';
import '../models/credit_card_model.dart';


class DashboardController {
double totalBalance = 3284.00;
double receitas = 3000.00;
double despesas = 1436.00;


List<CategoryModel> categories = [
CategoryModel(title: 'Educação', amount: 650.0, colorValue: 0xFF6A5AE0),
CategoryModel(title: 'Casa', amount: 276.0, colorValue: 0xFF4FA3F7),
CategoryModel(title: 'Alimentação', amount: 220.0, colorValue: 0xFFF4A261),
CategoryModel(title: 'Outros', amount: 290.0, colorValue: 0xFFEF6C6C),
];


List<CreditCardModel> cards = [
CreditCardModel(bank: 'Nubank', dueAmount: 380.0, dueDate: 'Vence amanhã'),
CreditCardModel(bank: 'Caixa', dueAmount: 200.0, dueDate: 'Vence em 2 dias'),
];
}