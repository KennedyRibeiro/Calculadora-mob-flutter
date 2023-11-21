import 'package:flutter/material.dart';
import 'package:prova_mensal/components/history.dart';
import 'package:prova_mensal/components/numbers_and_operations.dart';
import 'package:prova_mensal/components/result_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstNumber = "";
  String operation = "";
  String secondNumber = "";
  String result = "";
  List<String> history = [];

  Future<dynamic> _handleOpenHistory() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return History(history);
      },
    );
  }

  void _handleSelectedValue(String value) {
    setState(() {
      if (value == "=") {
        _handleCalculate();
      } else if (value == "C") {
        _handleClear();
      } else {
        // Determina se é um número ou uma operação
        if (double.tryParse(value) != null || value == ".") {
          // Se for um número ou um ponto, anexe ao operando atual
          if (operation.isEmpty) {
            firstNumber += value;
          } else {
            secondNumber += value;
          }
        } else {
          // É uma operação
          if (secondNumber.isNotEmpty) {
            // Se houver um segundo operando, calcule o resultado antes de atualizar a operação
            _handleCalculate();
          }
          operation = value;
        }
      }
    });
  }


  void _handleCalculate() {
    setState(() {
      if (firstNumber.isNotEmpty && secondNumber.isNotEmpty && operation.isNotEmpty) {
        double num1 = double.parse(firstNumber);
        double num2 = double.parse(secondNumber);

        switch (operation) {
          case "+":
            result = (num1 + num2).toString();
            break;
          case "-":
            result = (num1 - num2).toString();
            break;
          case "x":
            result = (num1 * num2).toString();
            break;
          case "/":
            if (num2 != 0) {
              result = (num1 / num2).toString();
            } else {
              result = "Erro"; // Divisão por zero
            }
            break;
        }

        // Adiciona o cálculo ao histórico
        history.insert(0, "$firstNumber $operation $secondNumber = $result");
      }
    });
  }

  void _handleClear() {
    setState(() {
      firstNumber = "";
      operation = "";
      secondNumber = "";
      result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prova Mensal | Calculadora"),
        actions: [
          IconButton(
            onPressed: _handleOpenHistory,
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: Column(
        children: [
          ResultDisplay(firstNumber, operation, secondNumber, result),
          NumbersAndOperations(_handleSelectedValue),
        ],
      ),
    );
  }
}
