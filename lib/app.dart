import 'package:flutter/material.dart';
import 'views/dashboard_page.dart';
import 'views/transactions_page.dart';
import 'views/profile_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
      routes: {
        '/dashboard': (_) => DashboardPage(),
        '/transacoes': (_) => TransactionsPage(),
        '/perfil': (_) => ProfilePage() 
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
