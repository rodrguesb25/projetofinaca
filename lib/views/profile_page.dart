import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../controllers/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = ProfileController();
  bool isEnglish = false;
  bool isLoading = false;

  Map<String, String> translatedValues = {};

  Future<String> translateText(String text) async {
    final url = Uri.parse(
        "https://api.mymemory.translated.net/get?q=$text&langpair=pt|en");

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    return data["responseData"]["translatedText"] ?? text;
  }

  Future<void> toggleLanguage() async {
    if (isLoading) return;

    if (!isEnglish) {
      // Traduzir apenas uma vez — depois fica em cache
      setState(() => isLoading = true);

      translatedValues = {
        "nome":     await translateText(controller.user.nome),
        "email":    await translateText(controller.user.email),
        "cpf":      await translateText(controller.user.cpf),
        "cep":      await translateText(controller.user.cep),
        "endereco": await translateText(controller.user.endereco),
        "numero":   await translateText(controller.user.numero),
        "celular":  await translateText(controller.user.celular),
      };

      setState(() {
        isEnglish = true;
        isLoading = false;
      });
    } else {
      // Voltar ao português
      setState(() => isEnglish = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = controller.user;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Perfil", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: isLoading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : Icon(Icons.translate),
            onPressed: isLoading ? null : toggleLanguage,
            tooltip: "Traduzir",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _infoCard("Nome", isEnglish ? translatedValues["nome"] ?? user.nome : user.nome),
            _infoCard("Email", isEnglish ? translatedValues["email"] ?? user.email : user.email),
            _infoCard("Idade", user.idade.toString()),
            _infoCard("CPF", isEnglish ? translatedValues["cpf"] ?? user.cpf : user.cpf),
            _infoCard("CEP", isEnglish ? translatedValues["cep"] ?? user.cep : user.cep),
            _infoCard("Endereço", isEnglish ? translatedValues["endereco"] ?? user.endereco : user.endereco),
            _infoCard("Número", isEnglish ? translatedValues["numero"] ?? user.numero : user.numero),
            _infoCard("Celular", isEnglish ? translatedValues["celular"] ?? user.celular : user.celular),
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
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
