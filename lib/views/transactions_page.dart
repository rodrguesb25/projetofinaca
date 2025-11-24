import 'package:flutter/material.dart';
import '../controllers/transactions_controller.dart';

class TransactionsPage extends StatelessWidget {
  final controller = TransactionsController();

  TransactionsPage() {
    controller.carregarTransacoes();
  }

  @override
  Widget build(BuildContext context) {
    final hoje = controller.getByDate(DateTime.now());
    final dia5 = controller.getByDate(DateTime(2025, 11, 5));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Transações"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Quarta, 05",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ...dia5.map(_tileTransacao),

            SizedBox(height: 20),
            Text("Hoje",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            ...hoje.map(_tileTransacao),
          ],
        ),
      ),
    );
  }

  Widget _tileTransacao(t) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Color(t.color)),
      title: Text(t.title),
      subtitle: Text(t.subtitle),
      trailing: Text(
        "R\$ ${(t.value.abs()).toStringAsFixed(2)}",
        style: TextStyle(
            color: t.value < 0 ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
