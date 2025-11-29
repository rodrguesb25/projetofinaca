import 'package:flutter/material.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    final user = controller.user;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Perfil",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _infoCard("Nome", user.nome),
            _infoCard("Email", user.email),
            _infoCard("Idade", user.idade.toString()),
            _infoCard("CPF", user.cpf),
            _infoCard("CEP", user.cep),
            _infoCard("Endereço", user.endereco),
            _infoCard("Número", user.numero),
            _infoCard("Celular", user.celular),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 1,
            color: Colors.black12,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
