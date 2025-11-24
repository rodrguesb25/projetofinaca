import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/transactions_controller.dart';

class DashboardPage extends StatelessWidget {
  final dashboardController = DashboardController();
  final transactionsController = TransactionsController();

  DashboardPage() {
    transactionsController.carregarTransacoes();
  }

  @override
  Widget build(BuildContext context) {
    final trans = transactionsController.transacoes;

    final receitas = dashboardController.getTotalReceitas(trans);
    final despesas = dashboardController.getTotalDespesas(trans);
    final categorias =
        dashboardController.getDespesasPorCategoria(trans);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text("Janeiro", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("R\$ ${(receitas - despesas).toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold)),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _saldoCard("Entradas", receitas, Colors.green),
                _saldoCard("Despesas", despesas, Colors.red),
              ],
            ),

            SizedBox(height: 30),
            Text("Despesas por categoria",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            _listaCategorias(categorias),
          ],
        ),
      ),
    );
  }

  Widget _saldoCard(String title, double valor, Color cor) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 5),
          Text(
            "R\$ ${valor.toStringAsFixed(2)}",
            style: TextStyle(
                color: cor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _listaCategorias(Map<String, double> cat) {
    return Column(
      children: cat.entries
          .map(
            (e) => ListTile(
              title: Text(e.key),
              trailing: Text("R\$ ${e.value.toStringAsFixed(2)}"),
            ),
          )
          .toList(),
    );
  }
}
