import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  final List<Map<String, dynamic>> transacoes = [
    {"nome": "Mercado", "data": "Hoje", "valor": -75.50},
    {"nome": "Uber", "data": "Ontem", "valor": -22.90},
    {"nome": "Salário", "data": "03 Fev", "valor": 2800.00},
    {"nome": "Lanche", "data": "02 Fev", "valor": -28.00},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transações"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: transacoes.length,
        itemBuilder: (context, i) {
          final t = transacoes[i];
          final valorPositivo = t["valor"] >= 0;

          return Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6, spreadRadius: 1, color: Colors.black12)
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t["nome"],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(t["data"], style: TextStyle(color: Colors.black54)),
                  ],
                ),
                Text(
                  (valorPositivo ? "+ " : "- ") +
                      "R\$ " +
                      t["valor"].abs().toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 18,
                    color: valorPositivo ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
