import 'package:flutter/material.dart';
import 'package:prova_mensal/components/selected_value_box.dart';

class ResultDisplay extends StatelessWidget {
  final String firstNumber;
  final String operation;
  final String secondNumber;
  final String result;

  const ResultDisplay(
      this.firstNumber, this.operation, this.secondNumber, this.result,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SelectedValueBox(firstNumber),
          SelectedValueBox(operation),
          SelectedValueBox(secondNumber),
          const Text("="),
          SelectedValueBox(result),
        ],
      ),
    );
  }
}
