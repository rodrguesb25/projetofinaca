import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Finaças Track',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.list), label: 'Transações'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        onDestinationSelected: (i) {
          if (i == 1) {
            Navigator.pushNamed(context, '/transacoes');
          }
          if (i == 2) {
            Navigator.pushNamed(context, '/perfil');
          }
        },

      ),

      // Conteúdo
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saldo
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Saldo Atual",
                      style: TextStyle(color: Colors.white70, fontSize: 16)),
                  SizedBox(height: 10),
                  Text("R\$ 12.480,00",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text("Categorias",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            SizedBox(height: 16),

            // Cards categorias
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _categoryCard(Icons.shopping_bag, "Compras", "R\$ 340"),
                _categoryCard(Icons.fastfood, "Alimentação", "R\$ 220"),
                _categoryCard(Icons.directions_car, "Transporte", "R\$ 120"),
              ],
            ),

            SizedBox(height: 32),

            Text("Últimas Transações",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

            SizedBox(height: 12),

            _transactionItem("Mercado", "Hoje", "- R\$ 75,50", Colors.red),
            _transactionItem(
                "Uber", "Ontem", "- R\$ 22,90", Colors.orangeAccent),
            _transactionItem(
                "Salário", "03 Fev", "+ R\$ 2.800,00", Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard(IconData icon, String label, String value) {
    return Container(
      width: 105,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 8,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 28, color: Colors.deepPurple),
          SizedBox(height: 10),
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(value, style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _transactionItem(
      String title, String date, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: color, size: 14),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(date, style: TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color)),
        ],
      ),
    );
  }
}
