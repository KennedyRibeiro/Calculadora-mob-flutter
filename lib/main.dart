import 'package:flutter/material.dart';
import 'package:prova_mensal/screens/home.dart';

void main() {
  runApp(const ProvaMensal());
}

class ProvaMensal extends StatelessWidget {
  const ProvaMensal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova Mensal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
